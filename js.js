$(document).ready(function()
{
    $("input[name='get']").click(function()
    {
        $(".send").val($(this).attr('id'));
    });
}
);

