require 'rubygems'
require 'active_support/inflector'

class Instore

SETUP = { 

		  'menu_category'       	   => ['list', 'create', 'update', 'delete'],  
	      'menu_item'	    		     => ['add', 'hold'], 
        'tax'            			   => ['list', 'add', 'update', 'remove'],
        'discount'       			   => ['add', 'delete', 'list', 'update'], 
        'ingredient'    			   => ['list', 'create', 'delete', 'update'], 
        'unique_quality' 			   => ['list'],
        'location'       			   => ['list'],
        'location_group' 			   => ['list', 'fetch'], 
        'order'    	   			     => ['list', 'create', 'fetch', 'refund', 'void'], 
        'order_payment'  			   => ['add'],
        'held_order'     			   => ['hold', 'unhold'],
        'order_line'    			   => ['add', 'remove'], 
        'order_line_ingredient'  => ['add', 'remove'], 
        'order_discount'    		 => ['add', 'remove']

        }

SETUP.each do |k, v|

  v.each do |operation|

	build_url({(operation + "_" + fetch_operation(operation, k)[1]).to_sym => {:method => (fetch_operation(operation, k)[0]), :url => ('/' + fetch_base_url(k)) } })
  
  end

end

end
