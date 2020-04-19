/*
 * El siguiente código me permite dibujar una esfera.
 * No incluye fondo.
*/

#include "colors.inc" //Para incluir nombres de colores

//Radio de la esfera
#declare radio=.05;

//Funcion para calcular una función amtemática
#declare funcion=function(angulo){sin(2*pi*angulo)};

//Valor de la altura, dada una función  segun el tiempo.
#declare valor=funcion(clock);

//Avance del eje x
#declare avance=pi*clock;



//Cámara
//Me permite colocar una cámara y aputarla a una localización específica.
camera{
    //Dónde se encuentra la cámara con coordenadas <x,y,z>
    location <pi/2,.5,-3>
    //A donde apunta con coordenadas <x,y,z>
    look_at <pi/2,.5,3>
    }

//Fuente de luz
  light_source {
    <2, 10, -3>
    color White
    area_light <5, 0, 0>, <0, 0, 5>, 5, 5
    adaptive 1
    jitter
  }
  
//Esferai
  
sphere{
    //Localización y radio
    <avance,valor,0>, radio
    //Textura de la esfera
    texture{
	//Solo se usa pigmento    
        pigment{
	    //Color en RGB y transparencia del color
            color Red
        }
	//El acabado final y representa una propiedad de la reflexión de la luz
        finish{
            phong 1         
        }   
    }
}


//Ciclo para poner esferas
//Varaible de control
#declare control=0;
#while (control<=avance-2*radio)
	union{
sphere{
    //Localización y radio
    <control,sin(control*2),0>, radio
    //Textura de la esfera
    texture{
		//Solo se usa pigmento    
	        pigment{
		    	    //Color en RGB y transparencia del color
		            color rgb<0,0,1>
		            }
			//El acabado final y representa una propiedad de la reflexión de la luz
		        finish{
		                phong 1         
		        }   
	    }
    }
}
/*
    #fopen valores "valores.txt" append
	#write(valores, control," ",funcion(control),"\n")
#fclose valores
*/
#declare control=control+0.01;
#end


//Plano z 
  plane {
    y, -1.5
    texture {
	    pigment{
		    color rgb<1,1,1>
	    }
      finish {
        diffuse 0.4
        ambient 0.2
        phong 1
        phong_size 100
        reflection 0.25
      }
    }
  }

//Plano y
  plane {
    x, -1
    texture {
	    pigment{
		    color rgb<1,1,1>
	    }
      finish {
        diffuse 0.4
        ambient 0.2
        phong 1
        phong_size 100
        reflection 0.25
      }
    }
  }
  
 //Plano x
  plane {
    z, 1
    texture {
	    pigment{
		    color rgb<1,1,1>
	    }
      finish {
        diffuse 0.4
        ambient 0.2
        phong 1
        phong_size 100
        reflection 0.25
      }
    }
  }
