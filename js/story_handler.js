class StoryHandler {
    #story;
    #active;
    #content;
    #onStoryUpdate;
    #onChoicesUpdate;
    #tagCallbacks;
    #imageCallback;
    #soundCallback;

    constructor(
        content, onStoryUpdate, onChoicesUpdate,
        tagCallbacks = null, imageCallback = null, soundCallback = null) {
        this.#story = new inkjs.Story(content);
        this.#active = false;

        this.#content = content;
        this.#onStoryUpdate = onStoryUpdate;
        this.#onChoicesUpdate = onChoicesUpdate;
        this.#tagCallbacks = tagCallbacks || [];
        this.#imageCallback = imageCallback || (() => { });
        this.#soundCallback = soundCallback || (() => { });
    }

    start() {
        this.#active = true;
        this.#continue();
    }

    stop() {
        this.#active = false;
    }

    reset() {
        this.#active = false;
        this.#story = new inkjs.Story(this.#content);
    }

    makeChoice(index) {
        this.#story.ChooseChoiceIndex(index);
        this.#continue();
    }

    getVariables() {
        return this.#story.variablesState;
    }

    #continue() {
        if (!this.#active) return;

        if (this.#story.canContinue) {
            const nextStory = this.#story.Continue();
            this.#actOnTags();
            if (nextStory.length > 0) {
                this.#onStoryUpdate(nextStory);
            }
        }

        const choices = this.#story.currentChoices;
        if (choices.length > 0) {
            this.#onChoicesUpdate(
                choices.map(c => ({ text: c.text, index: c.index }))
            );

        } else {
            this.#continue();
        }

    }

    #actOnTags() {
        for (const tag of this.#story.currentTags) {
            const tagCallback = this.#tagCallbacks.find(t => t.tag === tag);
            if (tagCallback) tagCallback.callback();
            if (tag.split(' ')[0] === 'IMAGE') {
                const url = tag.split(' ')[1];
                this.#imageCallback(url);
            }
            if (tag.split(' ')[0] === 'SOUND') {
                const url = tag.split(' ')[1];
                this.#soundCallback(url);
            }
        }
    }
}
