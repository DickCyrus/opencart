<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa-exclamation-sign"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="panel panel-default">
    <div class="panel-heading">
      <div class="pull-right">
        <button type="submit" form="form-featured" class="btn btn-primary"><i class="fa-ok"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger"><i class="fa-remove"></i> <?php echo $button_cancel; ?></a></div>
      <h1 class="panel-title"><i class="fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="panel-body">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-featured" class="form-horizontal">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
          <div class="col-sm-10">
            <input type="text" name="product" value="" placeholder="<?php echo $entry_product; ?>" id="input-product" class="form-control" />
            <span class="help-block"><?php echo $help_product; ?></span>
            <div id="featured-product" class="well">
              <?php foreach ($products as $product) { ?>
              <div id="featured-product<?php echo $product['product_id']; ?>"><i class="fa-minus-sign"></i> <?php echo $product['name']; ?>
                <input type="hidden" value="<?php echo $product['product_id']; ?>" />
              </div>
              <?php } ?>
            </div>
            <input type="hidden" name="featured_product" value="<?php echo $featured_product; ?>" class="form-control" />
          </div>
        </div>
        <table id="module" class="table table-striped table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $entry_limit; ?></td>
              <td class="text-left"><?php echo $entry_image; ?></td>
              <td class="text-left"><?php echo $entry_layout; ?></td>
              <td class="text-left"><?php echo $entry_position; ?></td>
              <td class="text-left"><?php echo $entry_status; ?></td>
              <td class="text-right"><?php echo $entry_sort_order; ?></td>
              <td></td>
            </tr>
          </thead>
          <tbody>
            <?php $module_row = 0; ?>
            <?php foreach ($modules as $module) { ?>
            <tr id="module-row<?php echo $module_row; ?>">
              <td class="text-left"><input type="text" name="featured_module[<?php echo $module_row; ?>][limit]" value="<?php echo $module['limit']; ?>" placeholder="<?php echo $entry_limit; ?>" class="form-control" /></td>
              <td class="text-left"><input type="text" name="featured_module[<?php echo $module_row; ?>][image_width]" value="<?php echo $module['image_width']; ?>" placeholder="<?php echo $entry_width; ?>" class="form-control" />
                <input type="text" name="featured_module[<?php echo $module_row; ?>][image_height]" value="<?php echo $module['image_height']; ?>" placeholder="<?php echo $entry_height; ?>" class="form-control" />
                <?php if (isset($error_image[$module_row])) { ?>
                <div class="text-danger"><?php echo $error_image[$module_row]; ?></div>
                <?php } ?></td>
              <td class="text-left"><select name="featured_module[<?php echo $module_row; ?>][layout_id]" class="form-control">
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              <td class="text-left"><select name="featured_module[<?php echo $module_row; ?>][position]" class="form-control">
                  <?php if ($module['position'] == 'content_top') { ?>
                  <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                  <?php } else { ?>
                  <option value="content_top"><?php echo $text_content_top; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'content_bottom') { ?>
                  <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                  <?php } else { ?>
                  <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_left') { ?>
                  <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                  <?php } else { ?>
                  <option value="column_left"><?php echo $text_column_left; ?></option>
                  <?php } ?>
                  <?php if ($module['position'] == 'column_right') { ?>
                  <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                  <?php } else { ?>
                  <option value="column_right"><?php echo $text_column_right; ?></option>
                  <?php } ?>
                </select></td>
              <td class="text-left"><select name="featured_module[<?php echo $module_row; ?>][status]" class="form-control">
                  <?php if ($module['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
              <td class="text-right"><input type="text" name="featured_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>
              <td class="text-left"><button type="button" onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="btn btn-danger"><i class="fa-minus-sign"></i> <?php echo $button_remove; ?></button></td>
            </tr>
            <?php $module_row++; ?>
            <?php } ?>
          </tbody>
          <tfoot>
            <tr>
              <td colspan="6"></td>
              <td class="text-left"><button type="button" onclick="addModule();" class="btn btn-primary"><i class="fa-plus-sign"></i> <?php echo $button_module_add; ?></button></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('#featured-product' + item['value']).remove();
		
		$('#featured-product').append('<div id="featured-product' + item['value'] + '"><i class="fa-minus-sign"></i> ' + item['label'] + '<input type="hidden" value="' + item['value'] + '" /></div>');	
	
		data = $.map($('#featured-product input'), function(element){
			return $(element).attr('value');
		});
						
		$('input[name=\'featured_product\']').attr('value', data.join());	
	}	
});

$('#featured-product').delegate('.fa-minus-sign', 'click', function() {
	$(this).parent().remove();

	data = $.map($('#featured-product input'), function(element){
		return $(element).attr('value');
	});
					
	$('input[name=\'featured_product\']').attr('value', data.join());	
});
//--></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<tr id="module-row' + module_row + '">';
	html += '  <td class="text-left"><input type="text" name="featured_module[' + module_row + '][limit]" value="5" placeholder="<?php echo $entry_limit; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><input type="text" name="featured_module[' + module_row + '][image_width]" value="80" placeholder="<?php echo $entry_width; ?>" class="form-control" /> <input type="text" name="featured_module[' + module_row + '][image_height]" value="80" placeholder="<?php echo $entry_height; ?>" class="form-control" /></td>';	
	html += '  <td class="text-left"><select name="featured_module[' + module_row + '][layout_id]" class="form-control">';
	<?php foreach ($layouts as $layout) { ?>
	html += '    <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
	<?php } ?>
	html += '  </select></td>';
	html += '  <td class="text-left"><select name="featured_module[' + module_row + '][position]" class="form-control">';
	html += '    <option value="content_top"><?php echo $text_content_top; ?></option>';
	html += '    <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
	html += '    <option value="column_left"><?php echo $text_column_left; ?></option>';
	html += '    <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '  </select></td>';
	html += '  <td class="text-left"><select name="featured_module[' + module_row + '][status]" class="form-control">';
    html += '    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
    html += '    <option value="0"><?php echo $text_disabled; ?></option>';
    html += '  </select></td>';
	html += '  <td class="text-right"><input type="text" name="featured_module[' + module_row + '][sort_order]" value="" placeholder="<?php echo $entry_sort_order; ?>" class="form-control" /></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#module-row' + module_row + '\').remove();" class="btn btn-danger"><i class="fa-minus-sign"></i> <?php echo $button_remove; ?></button></td>';
	html += '</tr>';
	
	$('#module tbody').append(html);
	
	module_row++;
}
//--></script> 
<?php echo $footer; ?>