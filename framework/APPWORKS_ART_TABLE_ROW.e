class APPWORKS_ART_TABLE_ROW
creation
	make
feature
	make (t: APPWORKS_ART_TABLE) is
		do
			my_table := t
			my_index := t.row_count
			!!my_item.make
		end
	set_text (i: INTEGER; s: STRING) is
		do
			my_table.set_text(my_index, i, s)
			--~ my_item.set_text(my_index, i, s)
			--~ my_item.update(my_table)
		end
feature
	my_table: APPWORKS_ART_TABLE
	my_item:  APPWORKS_ART_TABLE_ITEM
	my_index: INTEGER
end -- class APPWORKS_ART_TABLE_ROW
