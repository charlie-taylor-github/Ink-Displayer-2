const ui = {
    storyBody: document.getElementById('story-body'),
    choicesDiv: document.getElementById('choices-div'),
    weaponsDiv: document.getElementById('weapons-div'),
    alliesDiv: document.getElementById('allies-div'),
    image: document.getElementById('img'),
    stats: {
        time: document.getElementById('stat-time'),
        hero: {
            strength: document.getElementById('stat-hero-strength'),
            charisma: document.getElementById('stat-hero-charisma'),
            dexterity: document.getElementById('stat-hero-dexterity'),
            wisdom: document.getElementById('stat-hero-wisdom'),
            groats: document.getElementById('stat-hero-groats'),
            food: document.getElementById('stat-hero-food'),
            drink: document.getElementById('stat-hero-drink'),
            spells: document.getElementById('stat-hero-spells')
        }
    }
}

const gameState = {
    time: -1,
    hero: {
        strength: -1,
        charisma: -1,
        dexterity: -1,
        wisdom: -1,
        groats: -1,
        food: -1,
        drink: -1,
        spells: -1
    },
    allies: [
        {
            name: "Ally 1",
            strength: -1,
            alive: true
        }
    ],
    weapons: []
}

function updateVariables() {
    ui.stats.time.innerText = gameState.time;
    ui.stats.hero.strength.innerText = gameState.hero.strength;
    ui.stats.hero.charisma.innerText = gameState.hero.charisma;
    ui.stats.hero.dexterity.innerText = gameState.hero.dexterity;
    ui.stats.hero.wisdom.innerText = gameState.hero.wisdom;
    ui.stats.hero.groats.innerText = gameState.hero.groats;
    ui.stats.hero.food.innerText = gameState.hero.food;
    ui.stats.hero.drink.innerText = gameState.hero.drink;
    ui.stats.hero.spells.innerText = gameState.hero.spells;

    ui.alliesDiv.innerHTML = '';
    for (const ally of gameState.allies) {
        if (!ally.alive) continue;
        const statEl = document.createElement('div');
        statEl.className = 'stat';
        const nameEl = document.createElement('h3');
        const strengthEl = document.createElement('h3');
        nameEl.innerText = ally.name;
        strengthEl.innerText = ally.strength;
        statEl.appendChild(nameEl);
        statEl.appendChild(strengthEl);
        ui.alliesDiv.appendChild(statEl);
    }

    ui.weaponsDiv.innerHTML = '';
    for (const weapon of gameState.weapons) {
        if (weapon.ammo <= 0) continue;
        const statEl = document.createElement('div');
        statEl.className = 'stat';
        const nameEl = document.createElement('h3');
        const ammoEl = document.createElement('h3');
        nameEl.innerText = weapon.name;
        ammoEl.innerText = weapon.ammo;
        statEl.appendChild(nameEl);
        statEl.appendChild(ammoEl);
        ui.weaponsDiv.appendChild(statEl);
    }
}

function updateVariablesState() {
    const newState = story.getVariables();
    gameState.time = newState['hour_count'];
    gameState.hero.strength = newState['HERO_strength'];
    gameState.hero.charisma = newState['HERO_charisma'];
    gameState.hero.dexterity = newState['HERO_dexterity'];
    gameState.hero.wisdom = newState['HERO_wisdom'];
    gameState.hero.groats = newState['HERO_groats'];
    gameState.hero.food = newState['HERO_food_total'];
    gameState.hero.drink = newState['HERO_drink_total'];
    gameState.hero.spells = newState['HERO_total_spell'];

    const allies = [];
    for (let i = 0; i < 100; i++) {
        const allyName = newState[`ALLY_${i}_name`];
        if (allyName === null) continue;
        const allyStrength = newState[`ALLY_${i}_strength`];
        if (allyStrength === null) continue;
        const allyAlive = newState[`ALLY_${i}_alive`];
        if (allyAlive === null) continue;
        allies.push({ name: allyName, strength: allyStrength, alive: allyAlive == 'ALIVE' })
    }
    gameState.allies = allies;

    const weapons = [];
    for (let i = 0; i < 100; i++) {
        const weaponName = newState[`ALLY_weapon_${i}_name_UC`];
        if (weaponName === null) continue;
        const weaponAmmo = newState[`HERO_weapon_${i}_ammo`];
        if (weaponAmmo === null) continue;
        weapons.push({ name: weaponName, ammo: weaponAmmo });
    }
    gameState.weapons = weapons;
    updateVariables();
}

function onStoryUpdate(story) {
    const el = document.createElement('p');
    el.textContent = story;
    ui.storyBody.appendChild(el);
    updateVariablesState();
}

function onChoicesUpdate(choices) {
    ui.choicesDiv.innerHTML = '';
    for (const choice of choices) {
        const choiceElement = document.createElement('h3');
        choiceElement.textContent = choice.text;
        choiceElement.addEventListener('click', e => {
            story.makeChoice(choice.index);
        });
        ui.choicesDiv.appendChild(choiceElement);
    }
}

function clearStory() {
    ui.storyBody.innerHTML = '';
}

function updateImage(url) {
    ui.image.src = `./assets/images/${url}`;
}

function playSound(url) {
    const audio = new Audio(`./assets/audio/${url}`);
    audio.play();
}

function restart() {
    story.reset();
    clearStory();
    story.start();
}

const tagCallbacks = [
    {
        tag: 'CLEAR',
        callback: clearStory
    },
    {
        tag: 'RESTART',
        callback: restart
    }
]

const story = new StoryHandler(
    storyContent, onStoryUpdate, onChoicesUpdate,
    tagCallbacks, updateImage, playSound
);
story.start();
