let login = document.querySelector('#login');
if (typeof(login) != "undefined" && login !== null) {
    login.addEventListener('click', async (e) => {
        e.preventDefault();
        let login = document.querySelector('#user-login').value;
        let password = document.querySelector('#user-password').value;
        let user = {
            login: login,
            password: password
        };
        let response = await fetch('login.php', {
            method: 'POST',
            body: JSON.stringify(user),
        });
        response = await response.json();
        const form = document.querySelector('#form-login');
        const flash = document.querySelector('#flash');
        switch (response.status) {
            case 'success':
                setTimeout(() => {
                    window.location.reload();
                },1500);
                form.classList.add('d-none');
                flash.classList.remove('d-block', 'bg-danger');
                flash.classList.add('d-block', 'bg-success');
                break;
            case 'error':
                flash.classList.remove('d-block', 'bg-success');
                flash.classList.add('d-block', 'bg-danger');
                break;
        }
        flash.textContent = `Login ${response.status}.`;
    })
}



