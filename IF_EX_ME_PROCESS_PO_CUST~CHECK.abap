method if_ex_me_process_po_cust~check.

  data:
    header type mepoheader,
    items  type purchase_order_items,
    item   type purchase_order_item,
    data   type mepoitem .

  if not im_header is initial.

    header = im_header->get_data( ) .

    items = im_header->get_items( ) .

    read table items into item index 1 .

    if sy-subrc eq 0.

      data = item-item->get_data( ) .
*     include zmmi0000 if found .

    endif.

  endif .

  free:
    header, items, item, data .

endmethod.
