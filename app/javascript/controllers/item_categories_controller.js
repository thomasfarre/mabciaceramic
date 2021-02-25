import { Controller } from "stimulus";

export default class extends Controller {

   static targets = [ "category", "categoryButton", "allCategory", "allButton", "pageButtons" ]



  display(event) {
    let type = event.target.getAttribute("data-type")
    event.currentTarget.classList.add('text-japonica-500', 'font-bold')
    this.categoryButtonTargets.filter(categoryButton => {
     if (categoryButton.getAttribute("data-type") != type){
      categoryButton.classList.remove('text-japonica-500', 'font-bold') }})

    // this.categoryTargets.filter(category => {
    //  if (category.getAttribute("data-type") != type){
    //   category.classList.add('hidden') }})

    //  this.categoryTargets.filter(category => {
    //   if (category.getAttribute("data-type") == type){
    //    category.classList.remove('hidden') }})

    this.allCategoryTarget.classList.add('hidden')
    this.allButtonTarget.classList.remove('text-japonica-500', 'font-bold')
    this.allButtonTarget.classList.add('text-gray-600', 'font-medium')

    let categoryContainer = this.categoryTargets.filter(category => category.getAttribute("data-type") == type)
    var clone = categoryContainer[0].cloneNode(true)
    let itemsFiltered = clone.children
    let arr = [].slice.call(itemsFiltered)

    let state = {
      'querySet': arr,
      'page': 1,
      'rows': 2,
      'window': 5,
    }

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
          wrapper.innerHTML += `<button value=${page} class="page px-2 py-1 bg-japonica-500 text-white font-bold">${page}</button>`
        }

        if (state.page != 1) {
            wrapper.innerHTML = `<button value=${1} class="page px-2 py-1 bg-japonica-500 text-white font-bold"> First </button>` + wrapper.innerHTML
        }

        if (state.page != pages) {
            wrapper.innerHTML += `<button value=${pages} class="page px-2 py-1 bg-japonica-500 text-white font-bold">Last </button>`
        }

        $('.page').on('click', function() {

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


  displayAll() {

    // this.allCategoryTarget.classList.remove('hidden')
    this.allButtonTarget.classList.add('text-japonica-500', 'font-bold')

    this.categoryButtonTargets.forEach(categoryButton => {
      categoryButton.classList.remove('text-japonica-500', 'font-bold')
    })

    // this.categoryTargets.forEach(category => {
    //   category.classList.add('hidden')
    // })

    let categoryContainer = this.allCategoryTarget
    var clone = categoryContainer.cloneNode(true)
    let itemsFiltered = clone.children
    let arr = [].slice.call(itemsFiltered)

    var state = {
      'querySet': arr,
      'page': 1,
      'rows': 2,
      'window': 5,
    }

    var pagesContainer = this.pageButtonsTarget
    // var table = this.allCategoryTarget

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
          wrapper.innerHTML += `<button value=${page} class="page px-2 py-1 bg-japonica-500 text-white font-bold">${page}</button>`
        }

        if (state.page != 1) {
            wrapper.innerHTML = `<button value=${1} class="page px-2 py-1 bg-japonica-500 text-white font-bold"> First </button>` + wrapper.innerHTML
        }

        if (state.page != pages) {
            wrapper.innerHTML += `<button value=${pages} class="page px-2 py-1 bg-japonica-500 text-white font-bold">Last </button>`
        }

        $('.page').on('click', function() {
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

                table.append(myList)
            }

        pageButtons(data.pages)
    }

  }





  connect() {

    let categoryContainer = this.allCategoryTarget
    var clone = categoryContainer.cloneNode(true)
    let itemsFiltered = clone.children
    let arr = [].slice.call(itemsFiltered)

    var state = {
      'querySet': arr,
      'page': 1,
      'rows': 2,
      'window': 5,
    }

    var pagesContainer = this.pageButtonsTarget
    // var table = this.allCategoryTarget

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
          wrapper.innerHTML += `<button value=${page} class="page px-2 py-1 bg-japonica-500 text-white font-bold">${page}</button>`
        }

        if (state.page != 1) {
            wrapper.innerHTML = `<button value=${1} class="page px-2 py-1 bg-japonica-500 text-white font-bold"> First </button>` + wrapper.innerHTML
        }

        if (state.page != pages) {
            wrapper.innerHTML += `<button value=${pages} class="page px-2 py-1 bg-japonica-500 text-white font-bold">Last </button>`
        }

        $('.page').on('click', function() {
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

                table.append(myList)
            }

        pageButtons(data.pages)
    }

  }

}
