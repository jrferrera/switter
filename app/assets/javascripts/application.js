// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require home
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require_tree .

$(document).ready(function(){
	var switWordLimit = 140;

	$("#counter").text(switWordLimit + " remaining characters");

	$("#swit_content").keyup(function(){
		switLength = $("#swit_content").val().length;
				
		$("#counter").text((switWordLimit - switLength) + " remaining characters");
	});

	$("#swit_content").blur(function(){
		switLength = $("#swit_content").val().length;
		$("#counter").text((switWordLimit - switLength) + " remaining characters");
	});

	$("new_user sign_up_button").click(function(){

	});
});

$(function(){ $(document).foundation(); });

$("#counter").load(function(){
	var switWordLimit = 140;

	$("#counter").text(switWordLimit + " remaining characters");
});