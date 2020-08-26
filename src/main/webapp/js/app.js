var ToDoJsLib = ToDoJsLib || {};

ToDoJsLib.showGrid = function(){
    var me = this;

    var xhr = new XMLHttpRequest();

    var requestResponse = [];
    xhr.onreadystatechange = function(){
        if (xhr.readyState == XMLHttpRequest.DONE){
            if (xhr.status == 200){
                requestResponse = eval('(' + xhr.responseText + ')');

            }
        }
    }

    xhr.open('get', me.dataUrl, false);
    xhr.send();

    me.gridData = requestResponse;

    var tableContent = ``;
    tableContent += `<br/><table class='${me.gridStyle}'><tr>`;

    me.gridColumns.forEach(col => {
        tableContent += `<th>${col.header}</th>`;
    });
    tableContent += `</tr>`;

    me.gridData.forEach(row => {

        tableContent += `<tr>`;

        me.gridColumns.forEach(col => {
            tableContent += `<td>${row[col.dataIndex]}</td>`;
        });

        tableContent += `</tr>`;
    });

    tableContent += `</table>`;

    document.getElementById('module-content').innerHTML = tableContent;

}
