function expandSearchBarOnClick(){
  const toggleSearchBar = (event) => {
    event.currentTarget.classList.toggle("search-box-expand")
  }
  const searchBoxCollapse = document.querySelector(".search-box-collpase");
  searchBoxCollapse.addEventListener("click", toggleSearchBar);
}

export { expandSearchBarOnClick };
