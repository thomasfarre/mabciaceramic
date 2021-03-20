import { Controller } from "stimulus";

export default class extends Controller {

   static targets = [ "category", "categoryButton", "allCategory", "allButton", "pageButtons" ]

// my 3 way of displaying items, first is when i arrived on the page you see all items, second is when you click on a category and last when you click back to all items
  connect() {
    this.allButtonTarget.classList.remove('text-japonica-500')
    this.allButtonTarget.classList.add('text-white', 'bg-japonica-500')
    this.categoryButtonTargets.forEach(categoryButton => {
      categoryButton.classList.remove('text-white', 'bg-japonica-500')
      categoryButton.classList.add('text-japonica-500')
    })

    let state = this.setupPagination(this.getAll())
    this.pagination(state)

  }


  display(event) {

    let type = event.target.getAttribute("data-type")
    event.currentTarget.classList.remove('text-japonica-500')
    event.currentTarget.classList.add('text-white', 'bg-japonica-500')

    this.categoryButtonTargets.filter(categoryButton => {
     if (categoryButton.getAttribute("data-type") != type){
      categoryButton.classList.remove('text-white', 'bg-japonica-500')
      categoryButton.classList.add('text-japonica-500') }})
    this.allButtonTarget.classList.remove('text-white', 'bg-japonica-500')
    this.allButtonTarget.classList.add('text-japonica-500')



    let state = this.setupPagination(this.getByCategory(type))
    this.pagination(state)

  }

  displayAll() {
    this.connect()
  }


// this is somes methods to set pagination logic to work

  getByCategory(type) {

    let categoryContainer = this.categoryTargets.filter(category => category.getAttribute("data-type") == type)
    var clone = categoryContainer[0].cloneNode(true)

    return clone

  }

  getAll() {

    let categoryContainer = this.allCategoryTarget
    var clone = categoryContainer.cloneNode(true)

    return clone

  }


  setupPagination(clone) {

    let itemsFiltered = clone.children
    let arr = [].slice.call(itemsFiltered)

    var state = {
      'querySet': arr,
      'page': 1,
      'rows': 4,
      'window': 5,
    }

    return state

  }


// this is my pagination logic

  pagination(state) {

    var pagesContainer = this.pageButtonsTarget

    $('#table').empty()
    buildTable()

    function pagination(querySet, page, rows) {

      var trimStart = (page - 1) * rows
      var trimEnd = trimStart + rows

      var trimmedData = querySet.slice(trimStart, trimEnd)


      var pages = Math.round(querySet.length / rows);

      return {
          'querySet': trimmedData,
          'pages': pages,
      }
    }

    function pageButtons(pages) {

        var wrapper = pagesContainer

        wrapper.innerHTML = ``

        var maxLeft = (state.page - Math.floor(state.window / 2))
        var maxRight = (state.page + Math.floor(state.window / 2))

        if (maxLeft < 1) {
            maxLeft = 1
            maxRight = state.window
        }

        if (maxRight > pages) {
            maxLeft = pages - (state.window - 1)

            if (maxLeft < 1){
              maxLeft = 1
            }
            maxRight = pages
        }

        for (var page = maxLeft; page <= maxRight; page++) {
          wrapper.innerHTML += `<button value=${page} class="page px-2 py-1 bg-gray-100 text-gray-700 font-bold">${page}</button>`
        }

        // if (state.page != 1) {
        //     wrapper.innerHTML = `<button value=${1} class="page px-2 py-1 bg-gray-100 text-gray-700 font-bold"> First </button>` + wrapper.innerHTML
        // }

        // if (state.page != pages) {
        //     wrapper.innerHTML += `<button value=${pages} class="page px-2 py-1 bg-gray-100 text-gray-700 font-bold">Last </button>`
        // }


        $('.page').on('click', function() {

            document.documentElement.scrollTo({
              top: 200,
              behavior: "smooth"
            })

            $('#table').empty()
            state.page = Number($(this).val())

            buildTable()
        })

    }

    function buildTable() {

        var table = $('#table')

        var data = pagination(state.querySet, state.page, state.rows)

        var myList = data.querySet

        for (var i in myList) {
                // console.log(myList, table)
                // myList.append(table)

                table.append(myList)

            }

        pageButtons(data.pages)
    }
  }

}

