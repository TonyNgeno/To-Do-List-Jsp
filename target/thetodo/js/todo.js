(function(){
    ToDoJsLib.showGrid.call({
        dataUrl: 'uploadServlet',
        gridStyle: 'customers',
        gridColumns:[{
            header: 'Title',
            dataIndex: 'title'
        },{
            header: 'Description',
            dataIndex: 'description'
        }],
    });
})();