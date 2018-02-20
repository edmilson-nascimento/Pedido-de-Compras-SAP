method if_ex_me_process_po_cust~check.

"BOLK951749-20/2/2018-SS0028753-ENJ-begin
  data:
*   header type mepoheader,
    items  type purchase_order_items,
    item   type purchase_order_item,
    data   type mepoitem .

  if not im_header is initial.

*   header = im_header->get_data( ) .

    items = im_header->get_items( ) .

    read table items into item index 1 .

    if sy-subrc eq 0.

      data = item-item->get_data( ) .
      include zmmi0004 if found .

    endif.

  endif .

  free:
*   header, items, item, data .
    items, item, data .

"BOLK951749-20/2/2018-SS0028753-ENJ-end

endmethod.