document.addEventListener('turbolinks:load', function(){
    var control = document.querySelector('.sort-by-title');
    if (control) { control.addEventListener('click', sortRowsByTitle) }
});

function sortRowsByTitle() {
    var table = document.querySelector('table');
    var table_head = table.querySelector('thead');
    var rows = table.querySelectorAll('tr'); // NodeList
    var sortedRows = [];

    // select all table rows except first which is a table heading row
    for (var i = 1; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    var arrowUp = this.querySelector('.octicon-arrow-up');
    var arrowDown = this.querySelector('.octicon-arrow-down');

    if (arrowUp.classList.contains('hidden')) {
        sortedRows.sort(compareRowsASC);
        arrowUp.classList.remove('hidden');
        arrowDown.classList.add('hidden')
    } else {
        sortedRows.sort(compareRowsDESC);
        arrowUp.classList.add('hidden');
        arrowDown.classList.remove('hidden')
    }

    var sortedTable = document.createElement('table');

    sortedTable.classList.add('table', 'table-hover');
    sortedTable.appendChild(table_head);
    table_head.appendChild(rows[0]); // append row[0] into thead

    for (var idx = 0; idx < sortedRows.length; idx++) {
        sortedTable.appendChild(sortedRows[idx]);
    }

    table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsASC(row1, row2) {
    var testTitle1 = row1.querySelectorAll('td')[1].textContent;
    var testTitle2 = row2.querySelectorAll('td')[1].textContent;

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDESC(row1, row2) {
    var testTitle1 = row1.querySelectorAll('td')[1].textContent;
    var testTitle2 = row2.querySelectorAll('td')[1].textContent;

    if (testTitle1 < testTitle2) { return 1 }
    if (testTitle1 > testTitle2) { return -1 }
    return 0
}