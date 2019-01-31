function cambiar_contrasenia(){
    //if(document.perfil.cambiar_contrasenia.checked == true){
        document.getElementById('campos_contrasenia').style.display='block';
        document.getElementById('recogiendo').required = true;
    /*}else{
        document.getElementById('recojanme').style.display='none';
        document.getElementById('recogiendo').required = false;
        var ele = document.getElementsByName("metodo");
        for(var i=0;i<ele.length;i++){
          ele[i].checked = false;
        }
    }*/
}
function uploadFile(){
    const input = document.getElementById('fotoPerfil');
    if(input.files && input.files[0]){
        //console.log("File Seleccionado : ", input.files[0]);
        var file = URL.createObjectURL(document.getElementById('fotoPerfil').files[0]);
        document.getElementById('imgId1').src= file;
    }
    //=$(this).val();
    //console.log($(this).val());
    //alert(file);
}
//('#fotoPerfil').live('change',function(){ uploadFile(); });