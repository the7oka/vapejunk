$(document).ready(function(){
	console.log('Hello')
	recipalize();
	$('#recipe_name, #recipe_amount, #recipe_nic_strength, #recipe_nic_vg, #recipe_target_nic, #recipe_target_vg').change(function(){recipalize()})
	$(document).on('change', '.fname, .fpercentage, .fvg', function() { recipalize()})
})
var recipalize = function(){
	$('tbody').html('')
	nic()
	flavor()
	vgml()
	pgml()
	sum()

}
var nic = function(){
	$('tbody').append('<tr><th>Nicotine</th><td>'+(nicml()).toFixed(1)+'</td></tr>')
}
var nicml = function(){	
	return (($('#recipe_target_nic').val()/100)*sumo())*(100/$('#recipe_nic_strength').val()).toFixed(1);
}
var flavor = function(){
	var sum = $('#recipe_amount').val()
	var flavorscount = $('.fpercentage').length
	for (i = 0; i < flavorscount; i++) {
    	x = $('.fpercentage').eq(i).val()
    	flavorml = ((x/100)*sumo()).toFixed(1)
    	flavorname = $('.fname').eq(i).val()
    	$('tbody').append('<tr><th>'+flavorname+'</th><td>'+flavorml+'</td></tr>')
	}

}
var flavorvg = function(){
	var flavorscount = $('.fpercentage').length
	var totalfvg = 0
	for (i = 0; i < flavorscount; i++) {
    	x = $('.fpercentage').eq(i).val()
    	flavorml = (x/100)*sumo()
    	fvg = $('.fvg').eq(i).prop("checked") ? 1 : 0;
    	if (fvg == 1){
    		totalfvg = totalfvg + flavorml
    	}
	}
	if (flavorscount > 0){
		return totalfvg
	}else{
		return 0
	}
}
var flavorpg = function(){
	var flavorscount = $('.fpercentage').length
	var totalfpg = 0
	for (i = 0; i < flavorscount; i++) {
    	x = $('.fpercentage').eq(i).val()
    	flavorml = (x/100)*sumo()
    	fpg = $('.fvg').eq(i).prop("checked") ? 1 : 0;
    	if (fpg == 0){
    		totalfpg = totalfpg + flavorml
    	}
	}
	if (flavorscount > 0){
		return totalfpg
	}else{
		return 0
	}
}
var nicvg = function(){
	if ($('#recipe_nic_vg').val() == 0){
		return 0
	}else{
		return ($('#recipe_nic_vg').val()/100)*nicml()
	}
}
var nicpg = function(){
	if ($('#recipe_nic_vg').val() == 100){
		return nicml()
	}else{
		return ((100 - $('#recipe_nic_vg').val())/100)*nicml()
	}
}
var vgml = function(){
	vg = ($('#recipe_target_vg').val()/100)*sumo()
	xvg = vg - (flavorvg() + nicvg())
	$('tbody').append('<tr><th>VG</th><td>'+xvg.toFixed(1)+'</td></tr>')
}
var pgml = function(){
	pg = ((100 - $('#recipe_target_vg').val())/100)*sumo()
	console.log(pg)
	console.log(flavorpg())
	console.log(nicpg())
	xpg = pg - (flavorpg() + nicpg())
	$('tbody').append('<tr><th>PG</th><td>'+xpg.toFixed(1)+'</td></tr>')
}
var sum = function(){
	$('tbody').append('<tr class="success"><th>Sum</th><td>'+sumo()+'</td></tr>')

}
var sumo = function(){
	return $('#recipe_amount').val();
}