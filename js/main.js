let login = document.querySelector('#login');
login.addEventListener('click', async (e) => {
    e.preventDefault();
    let login = document.querySelector('#user-login').value;
    let password = document.querySelector('#user-password').value;
    let response = await fetch('login.php', {
        method: 'POST',
        headers: {
            'Content-type': "application/x-www-form-urlencoded"
        },
        body: `user[login]=${login}&user[password]=${password}`
    });
    response = await response.json();
    console.dir(response);
    const form = document.querySelector('#form-login');
    const flash = document.querySelector('#flash');
    if (response.status === 'success') {
        flash.classList.add()
    } else {

    }
    console.dir(form);

})


