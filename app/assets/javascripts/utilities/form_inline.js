document.addEventListener('turbolinks:load', function(){
    const controls = document.querySelectorAll('.form-inline-edit-link');

    if (controls.length) {
        for (let i = 0; i < controls.length; i++) {
            controls[i].addEventListener('click', formInlineEditLinkHandler)
        }
    }

    const errors = document.querySelector('.resource-errors');
    if (errors && controls.length) {
        const resourceId = errors.dataset.resourceId;
        formInlineHandler(resourceId)
    }
});

function formInlineEditLinkHandler(event) {
    event.preventDefault();

    const testId = this.dataset.testId;

    formInlineHandler(testId)
}

function formInlineHandler(testId) {
    const editLink = document.querySelector(`.form-inline-edit-link[data-test-id="${testId}"]`);
    const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`);
    const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`);

    if (formInline.classList.contains('hidden')) {
        testTitle.classList.add('hidden');
        formInline.classList.remove('hidden');
        editLink.textContent = 'Cancel'
    } else {
        testTitle.classList.remove('hidden');
        formInline.classList.add('hidden');
        editLink.textContent = 'Edit'
    }
}