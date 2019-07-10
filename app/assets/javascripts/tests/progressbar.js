document.addEventListener('turbolinks:load', function(){
    const progressBar = document.querySelector('.progress-bar');

    if (progressBar) {
        const progressPercentage = progressBar.dataset.progressPercentage;

        progressBar.setAttribute('aria-valuenow', progressPercentage);
        progressBar.setAttribute('style', `width: ${progressPercentage}%`)
    }
});