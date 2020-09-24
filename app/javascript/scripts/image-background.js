const imgbg = document.querySelector(".card-cocktail-img");
imgbg.addEventListener('click', (event) => {
    console.log("I've been clicked")
    imgbg.style.backgroundImage = "url('https://source.unsplash.com/lwoTuByIuC4/1600x900')"
});