function expandSearchBarOnClick(){
  const searchField = document.querySelector(".search-box-collapse");

  const addSearchBar = (event) => {
    // event.preventDefault();
    searchField.classList.toggle("search-box-expand");
    searchField.classList.toggle("search-box-collapse");
    searchField.focus();
  }

  const searchBoxExpand = document.querySelector(".search-btn");
  searchBoxExpand.addEventListener("click", addSearchBar);
}

export { expandSearchBarOnClick };
