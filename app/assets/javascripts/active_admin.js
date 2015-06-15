/**
 * Created by root on 10/6/15.
 */

//= require active_admin/base

// = require redactor-rails

$(document).ready(function(){


    $('body').on('change','#contents_content_type',function(){
        var title = $(this).val();

        if(title == 'Article')
        {
            $('.video').hide();

            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').hide();
            $('.Manual').parent().hide();

            $('#contents_images').removeAttr('multiple');
            $('#contents_images').attr('name','contents[images]');
            $('#contents_images').parent().find('label').html('Image');
            $('#contents_images').parent('li').show();
            $('.article').show();


        }
        if(title == 'Gallery')
        {
            $('.video').hide();
            $('.article').hide();

            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').hide();
            $('.Manual').parent().hide();

            $('#contents_images').attr('multiple',true);
            $('#contents_images').attr('name','contents[images][]');
            $('#contents_images').show();
            $('#contents_images').parent('li').show();
            $('#contents_images').parent().find('label').html('Gallery Image');

        }
        if(title == 'Video')
        {

            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').hide();
            $('.Manual').parent().hide();

            $('.article').hide();
            $('#contents_images').parent('li').hide();
            $('.video').show();

        }

        if(title == ""){

            $('.video').hide();
            $('.article').hide();

            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').hide();
            $('.Manual').parent().hide();

            $('#contents_images').parent('li').hide();
        }

    });

    $('body').on('change','#contents_videosource',function() {
        var video = $(this).val();

        if(video == 'YouTube'){
            $('.YouTube').show();
            $('.YouTube').parent().show();

            $('.Manual').hide();
            $('.Manual').parent().hide();
        }

        if(video == 'Manual Upload'){
            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').show();
            $('.Manual').parent().show();
        }

        if(video == ''){
            $('.YouTube').hide();
            $('.YouTube').parent().hide();

            $('.Manual').hide();
            $('.Manual').parent().hide();
        }

    });
})