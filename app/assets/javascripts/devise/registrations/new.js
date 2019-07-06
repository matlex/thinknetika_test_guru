document.addEventListener('turbolinks:load', function() {
    const PASSWORD_MIN_LENGTH = 6;

    var password_field = document.getElementById('user_password');
    var confirmation_password_field = document.getElementById('user_password_confirmation');

    password_field.addEventListener('input', validate);
    confirmation_password_field.addEventListener('input', validate);

    function validate() {
        // remove validation classes when both fields or confirmation field is empty
        if (!password_field.value && !confirmation_password_field.value || password_field.value && !confirmation_password_field.value) {
            clearAllValidations();
        } else if (password_field.value && confirmation_password_field.value) {
            if (password_field.value == confirmation_password_field.value &&
                password_field.value.length >= PASSWORD_MIN_LENGTH &&
                confirmation_password_field.value.length >= PASSWORD_MIN_LENGTH) {

                password_field.classList.remove('is-invalid');
                confirmation_password_field.classList.remove('is-invalid');

                password_field.classList.add('is-valid');
                confirmation_password_field.classList.add('is-valid');
            } else {
                password_field.classList.remove('is-valid');
                password_field.classList.add('is-invalid');

                confirmation_password_field.classList.remove('is-valid');
                confirmation_password_field.classList.add('is-invalid');
            }
        } else if (!password_field.value && confirmation_password_field) {
            confirmation_password_field.classList.add('is-invalid');
        }
    }

    function clearAllValidations() {
        password_field.classList.remove('is-valid');
        password_field.classList.remove('is-invalid');

        confirmation_password_field.classList.remove('is-valid');
        confirmation_password_field.classList.remove('is-invalid')
    }
});