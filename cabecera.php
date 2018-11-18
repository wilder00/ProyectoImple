<div id="titulo">
    <img src="imagenes\fondo.jpg" alt="">
    

<div id="cabecera">
    <nav>           
    <div>
            
        <div id="comandar">
            <button id="mostrara"><img src="imagenes\gi.png" alt="" id="imagen"></button>
        </div>

        <div id="registro" style="display:none">
            <ul>
                <li><a href="intranet/login.html">Intranet</a></li>
            </ul>
        </div>
        
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <script>
            $("#mostrara").click(function(){
                var estado = $("#registro").css("display");
                if (estado == "none") {
                    $("#registro").show();
                    $("#mostrara").img("imagenes\gi.png");
                } else {
                    $("#registro").hide();
                    $("#mostrara").img("imagenes\gi.png");
                }
               
            });
        </script>
    
    </div>
    
    </nav>
</div>
</div>