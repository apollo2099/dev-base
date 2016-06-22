function refreshTable(toFirst) {
	if(toFirst){//表格重绘，并跳转到第一页
		defTable.fnDraw();
	}else{//表格重绘，保持在当前页
		defTable.fnDraw(false);
	}
}