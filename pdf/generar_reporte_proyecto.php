<?php
/*
use \setasign\Fpdi\Fpdi;

require_once('fpdf/fpdf.php');
require_once('fpdi2/src/autoload.php');

// initiate FPDI
$pdf = new Fpdi();

// get the page count
$pageCount = $pdf->setSourceFile('formulario_vinculacion.pdf');
// iterate through all pages
for ($pageNo = 1; $pageNo <= $pageCount; $pageNo++) {
    // import a page
    $templateId = $pdf->importPage($pageNo);

    $pdf->AddPage();
    // use the imported page and adjust the page size
    $pdf->useTemplate($templateId, ['adjustPageSize' => true]);

    $pdf->SetFont('Helvetica');
    $pdf->SetXY(5, 5);
    $pdf->Write(8, '');
}

// Output the new PDF
$pdf->Output();
*/
 
require_once('fpdf/fpdf.php');
class PDF extends FPDF 
{

// Cabecera de página
function Header()
{
    $fecha_actual=date("Y-m-d H:i:s");
    $fecha= 'Fecha y Hora: '.$fecha_actual;
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    $this->Image('imagenes/logoinformatica.png',0,10,50,'','png');//recibe(ruta,posicionx,posiciony,alto,ancho,tipo,link)
    // Movernos a la derecha
  
    $this->Cell(80);
    // Título
    $this->cell(43,10,utf8_decode('Universidad Nacional Autonóma de Honduras'),0,0,'C');
    $this->ln(8);
	$this->cell(0,10,utf8_decode('Facultad de Ciencias Economicas'),0,0,'C');
	$this->ln(8);
	$this->cell(0,10,utf8_decode('Departamento de Informatica Administrativa'),0,0,'C');
    $this->Ln(20);
    $this->SetFont('Arial','B',10);
    //$this->cell(0,6,'Fecha y Hora: ',0,0,'L',0);
    $this->cell(0,6,$fecha,0,1,'C',0);
    // Salto de línea
    $this->Ln(10);
    $this->SetFont('Arial','B',15);
    $this->cell(0,6,utf8_decode('Reporte de Proyecto Para Vinculación'),0,0,'C',0);
    $this->Ln(15);
    //encabezado de la tabla 
   // $this->cell(90, 10,'Nombre del Proyecto',0,1,'C',0);

}

// Pie de página
function Footer(){

    
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,utf8_decode('Página ').$this->PageNo().'/{nb}',0,0,'C');//recibe ancho,alto,texto,borde,alineacion,rellenar,link
}
}




//datos base de dato

require_once('../clases/Conexion.php');


if (isset($_GET['id'])){
    $id=$_GET['id'];
   
    }else{
    if (isset($_POST['id']) ){
    $id=$_POST['id'];

    }
    }

$consulta = "SELECT * FROM tbl_mgp_proyecto WHERE id_proyecto=$id";
$resultado = $mysqli->query($consulta);

$pdf = new PDF(); //crea el nuevo pdf
$pdf -> AliasNbPages();//pie de pagina
$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
$pdf->SetFont('Arial','U',16);//tipo de letra,estilo(b negrita,u subrayado) y tamaño


$pdf->SetFont('Arial','U',11);
$pdf->SetX(70); 
$pdf->cell(90, 10,strtoupper(utf8_decode('I.Información Academica Del Proyecto')),0,1,'C',0);


while($row = $resultado->fetch_assoc()){
    $reg=$row['id_reg_academico'];
    //me traigo la carrera a la que pertenece este proyecto
    $sql1 = "SELECT Descripcion FROM tbl_carrera WHERE id_carrera=(SELECT id_carrera FROM tbl_mgp_academico WHERE id_reg_academico=$reg)";
    $resultado1 = $mysqli->query($sql1);
  
    while($row1 = $resultado1->fetch_assoc()){
    $carrera=$row1['Descripcion'];
    }
   //me traigo el centro regional al que pertenece este proyecto
    $sql2 = "SELECT centro_regional FROM tbl_centros_regionales WHERE Id_centro_regional=(SELECT Id_centro_regional FROM tbl_mgp_academico WHERE id_reg_academico=$reg)";
    $resultado2 = $mysqli->query($sql2);
  
    while($row2 = $resultado2->fetch_assoc()){
    $centro_regional=$row2['centro_regional'];
    }


     //me traigo la facultad al que pertenece este proyecto
     $sql3 = "SELECT nombre FROM tbl_facultades WHERE Id_facultad=(SELECT Id_facultad FROM tbl_mgp_academico WHERE id_reg_academico=$reg)";
     $resultado3 = $mysqli->query($sql3);
   
     while($row3 = $resultado3->fetch_assoc()){
     $facultad=$row3['nombre'];
     }

    $pdf->SetFont('Arial','',11);
    $pdf->cell(90, 10,'Codigo del Proyecto: '.$row['id_proyecto'],0,1,'L',0);
    $pdf->cell(90, 10,'Tipo de Proyecto: '.$row['tip_proyecto'],0,1,'L',0);
    $pdf->cell(90, 10,'Nombre del proyecto: '.$row['nom_proyecto'],0,1,'L',0);
    $pdf->cell(90, 10,'Facultad: '.$facultad,0,1,'L',0);
    $pdf->cell(90, 10,'Centro Regional: '.$centro_regional,0,1,'L',0);
    $pdf->cell(90, 10,'Carrera: '.$carrera,0,1,'L',0);
    $pdf->SetFont('Arial','B',11);
    $pdf->cell(90, 10,utf8_decode('Fecha de revisión'),0,1,'L',0);
    $pdf->SetFont('Arial','',11);
    $pdf->cell(90, 10,'Fecha de Inicio: '.$row['fech_ini_proyecto'],0,1,'L',0);
    $pdf->cell(90, 10,utf8_decode('Fecha de Finalización: ').$row['fech_fin_proyecto'],0,1,'L',0);
    

    $pdf->SetFont('Arial','B',11);
    $pdf->cell(90, 10,utf8_decode('Fecha de Evaluación'),0,1,'L',0);
    $pdf->SetFont('Arial','',11);
    $pdf->cell(90, 10,'Intermedia: '.$row['fech_ini_revision'],0,1,'L',0);
    $pdf->cell(90, 10,utf8_decode('Final: ').$row['fech_fin_revision'],0,1,'L',0);
    $pdf->SetFont('Arial','B',11);
    $pdf->cell(90, 10,utf8_decode('No. de Beneficiarios'),0,1,'L',0);
    $pdf->SetFont('Arial','',11);
    $pdf->cell(90, 10,'Directos: '.$row['ben_directos'],0,1,'L',0);
    $pdf->cell(90, 10,'Indirectos: '.$row['ben_indirectos'],0,1,'L',0);
    $pdf->cell(90, 10,'Total: '.$row['total_beneficiarios'],0,1,'L',0);

    //me traigo la modalidad
    $idm=$row['id_modalidad'];
    $sql4 = "SELECT modalidad_proyecto FROM tbl_modalidades_proyecto WHERE id_modalidad_proyecto=$idm";
    $resultado4 = $mysqli->query($sql4);
  
    while($row4 = $resultado4->fetch_assoc()){
    $modalidad=$row4['modalidad_proyecto'];
    }

    $pdf->SetFont('Arial','',11);
    $pdf->cell(90, 10,'Modalidad: '.$modalidad,0,1,'L',0);

    $pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
    $pdf->cell(90, 10,utf8_decode('Tipo de Vinculación: '),0,1,'L',0);
    //traigo el tipo de vinculacion

       
   $sql51 = "SELECT id_vinculacion FROM tbl_mgp_vinculacion_proyecto WHERE id_proyecto=$id";
   $resultado51 = $mysqli->query($sql51);
   while($row51 = $resultado51->fetch_assoc()){

   $id_V = $row51['id_vinculacion'];

   $sql5 = "SELECT nombre FROM tbl_tip_vinculacion  WHERE id_tipos_v=$id_V";
    $resultado5 = $mysqli->query($sql5);
    while($row5 = $resultado5->fetch_assoc()){
    $pdf->cell(90, 10,$row5['nombre'],0,1,'L',0);

}
}
$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Costo del Proyecto'),0,1,'L',0);
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,'Total Dolares: '.$row['costo_total_usd'],0,1,'L',0);
$pdf->cell(90, 10,'Total Lempiras: '.$row['costo_total_lps'],0,1,'L',0);
$pdf->cell(90, 10,'% de Aporte de la Contraparte: '.$row['cant_empresa'],0,1,'L',0);
$pdf->cell(90, 10,'% de la UNAH: '.$row['cant_unah'],0,1,'L',0);
$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Vinculación con Entidades'),0,1,'L',0);

//nombre de la empresa

$sql6 = "SELECT nombre FROM tbl_mgp_empresa WHERE id_empresa=(SELECT id_empresa FROM tbl_mgp_empresa_proyecto WHERE id_proyecto=$id)";
$resultado6 = $mysqli->query($sql6);
while($row6 = $resultado6->fetch_assoc()){
$Entidad = $row6['nombre'];


$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Nombre de la Entidad: ').$Entidad,0,1,'L',0);
$pdf->SetFont('Arial','',11);
}
//aporte
$idapor= $row['aporte_proyecto'];
$sql7 = "SELECT aporte FROM tbl_empresa_aporte_proyecto WHERE Id_aporte=$idapor";
$resultado7 = $mysqli->query($sql7);
while($row7 = $resultado7->fetch_assoc()){
$aporte = $row7['aporte'];


$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Aporte: ').$aporte,0,1,'L',0);
}
$idform= $row['id_formalizacion'];
$sql8 = "SELECT tipo_formalizacion FROM tbl_tipo_formalizacion_proyecto WHERE Id_tipo_formalizacion=$idform";
$resultado8 = $mysqli->query($sql8);
while($row8 = $resultado8->fetch_assoc()){
$formalizacion = $row8['tipo_formalizacion'];


$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Formalización: ').$formalizacion,0,1,'L',0);
}

//nombre de contacto


$sql9 = "SELECT nombre_contacto, id_empresa FROM tbl_mgp_contacto_empresa WHERE id_contacto_empresa=(SELECT id_contacto_empresa FROM tbl_mgp_empresa_proyecto WHERE id_proyecto=$id)";
$resultado9 = $mysqli->query($sql9);
while($row9 = $resultado9->fetch_assoc()){
$nombre_contacto = $row9['nombre_contacto'];
$id_em = $row9['id_empresa'];


$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Contacto Institucional: ').utf8_decode($nombre_contacto),0,1,'L',0);



//telefono/celular
$sql10 = "SELECT valor FROM tbl_mgp_contacto WHERE id_contacto_empresa=$id_em AND id_tip_contacto =5";
$resultado10 = $mysqli->query($sql10);
while($row10 = $resultado10->fetch_assoc()){
$celular = $row10['valor'];
}

$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Telefono/Celular: ').$celular,0,1,'L',0);

//correo
$sql11 = "SELECT valor FROM tbl_mgp_contacto WHERE id_contacto_empresa=$id_em AND id_tip_contacto =2";
$resultado11 = $mysqli->query($sql11);
while($row11 = $resultado11->fetch_assoc()){
$correo= $row11['valor'];
}

$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Correo Electrónico: ').$correo,0,1,'L',0);

//clasificacion
$sql12 = "SELECT descripcion FROM tbl_mgp_clasificacion WHERE id_clasificacion=$id_em";
$resultado12 = $mysqli->query($sql12);
while($row12 = $resultado12->fetch_assoc()){
$clasificacion= $row12['descripcion'];
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Clasificación: ').$clasificacion,0,1,'L',0);
}
}

$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion

$pdf->SetFont('Arial','U',11);
$pdf->SetX(70); 
$pdf->cell(90, 10,strtoupper(utf8_decode('II.Responsables Del Proyecto')),0,1,'C',0);



//coordinador nombre 
$contadorcoordinador=1;
$sql13 = "SELECT * FROM tbl_docentes_proyecto WHERE Id_proyecto=$id";
$resultado13 = $mysqli->query($sql13);
while($row13 = $resultado13->fetch_assoc()){
$coordinador= $row13['nombre_coordinador'];
$direccion_coordinador= $row13['direccion_coordinador'];
$cargo_coordinador= $row13['cargo_coordinador'];
$celular_coordinador= $row13['celular_coordinador'];
$telefono_coordinador= $row13['telefono_coordinador'];
$correo_coordinador= $row13['correo_coordinador'];

$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Coordinador Del Proyecto ').$contadorcoordinador,0,1,'L',0);
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Nombre: ').$coordinador,0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Dirección: ').$direccion_coordinador,0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Cargo: ').$cargo_coordinador,0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Telefonos: ').$celular_coordinador.' / '.$telefono_coordinador,0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Correo Electronico: ').$correo_coordinador,0,1,'L',0);
$contadorcoordinador++;
}







//estudiante
$contadorestudiante=1;
$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Integrantes Del Equipo'),0,1,'L',0);

$sqlx = "SELECT Id_estudiante_proyecto FROM tbl_mgp_estudiantes WHERE id_proyecto=$id";
$resultadox = $mysqli->query($sqlx);
while($rowx = $resultadox->fetch_assoc()){
    $idne=$rowx['Id_estudiante_proyecto'];

$sql17 = "SELECT * FROM tbl_estudiantes_proyecto WHERE id_estudiante_proyecto=$idne";
$resultado17 = $mysqli->query($sql17);

while($row17 = $resultado17->fetch_assoc()){
$nombre_estudiante=$row17['nombre_estudiante'];
$direccion_estudiante=$row17['direccion_estudiante'];
$cargo_estudiante=$row17['cargo_estudiante'];
$celular_estudiante=$row17['celular_estudiante'];
$telefono_estudiante=$row17['telefono_estudiante'];
$correo_estudiante=$row17['correo_estudiante'];

$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Integrante ').$contadorestudiante,0,1,'L',0);
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Nombre: ').$nombre_estudiante.utf8_decode('   ').
utf8_decode('Dirección: ').$direccion_estudiante.utf8_decode('   ').
utf8_decode('Cargo: ').$cargo_estudiante,0,1,'L',0);

$pdf->cell(90, 10,utf8_decode('Telefonos: ').$celular_estudiante.' / '.$telefono_estudiante.utf8_decode('   ').
utf8_decode('Correo Electronico: ').$correo_estudiante,0,1,'L',0);

$contadorestudiante++;

}
}

//asignaturas

$pdf->SetFont('Arial','B',11);
$pdf->cell(90, 10,utf8_decode('Asignaturas'),0,1,'L',0);

$id_asig=$row['id_asignatura'];

$sql14 = "SELECT asignatura FROM tbl_asignaturas WHERE Id_asignatura=$id_asig";
$resultado14 = $mysqli->query($sql14);

while($row14 = $resultado14->fetch_assoc()){
$asignatura=$row14['asignatura'];
}
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Nombre: ').$asignatura,0,1,'L',0);

//periodo

$id_per=$row['id_periodo'];

$sql15 = "SELECT num_periodo FROM tbl_periodo WHERE id_periodo=$id_per";
$resultado15 = $mysqli->query($sql15);

while($row15 = $resultado15->fetch_assoc()){
$periodo=$row15['num_periodo'];
}
$pdf->cell(90, 10,utf8_decode('Periodo: ').$periodo,0,1,'L',0);



//Seccion

$id_sec=$row['id_secciones'];

$sql16 = "SELECT seccion FROM tbl_mgp_secciones WHERE id_seccion=$id_sec";
$resultado16 = $mysqli->query($sql16);

while($row16 = $resultado16->fetch_assoc()){
$seccion=$row16['seccion'];
}

$pdf->cell(90, 10,utf8_decode('Sección: ').$seccion,0,1,'L',0);

$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
$pdf->SetFont('Arial','U',11);
$pdf->SetX(70); 
$pdf->cell(90, 10,strtoupper(utf8_decode('III.Zona de Influencia Del Proyecto')),0,1,'C',0);
$pdf->SetFont('Arial','',11);
//zona de influencia
$sql17 = "SELECT * FROM tbl_mgp_zona_influencia WHERE id_proyecto=$id";
$resultado17 = $mysqli->query($sql17);

while($row17 = $resultado17->fetch_assoc()){
$idr=$row17['id_region'];
$idd=$row17['id_departamento'];
$idm=$row17['id_municipio'];
$aldea_caserio=$row17['aldea_caserio'];
$barrio_colonia=$row17['barrio_colonia'];


//region
$sql18 = "SELECT region FROM tbl_mgp_region WHERE id_region=$idr";
$resultado18 = $mysqli->query($sql18);

while($row18 = $resultado18->fetch_assoc()){
$region=$row18['region'];
$pdf->cell(90, 10,utf8_decode('Región: '.$region),0,1,'L',0);
}

//departamento
$sql19 = "SELECT departamento FROM tbl_departamentos WHERE id_departamento=$idd";
$resultado19 = $mysqli->query($sql19);

while($row19 = $resultado19->fetch_assoc()){
$departamento=$row19['departamento'];
$pdf->cell(90, 10,utf8_decode('Departamento: '.$departamento),0,1,'L',0);
}

//municipio
$sql20 = "SELECT municipio FROM tbl_municipios_hn WHERE id_municipio=$idm";
$resultado20 = $mysqli->query($sql20);

while($row20 = $resultado20->fetch_assoc()){
$municipio=$row20['municipio'];
$pdf->cell(90, 10,utf8_decode('Municipio: '.$municipio),0,1,'L',0);
}
$pdf->cell(90, 10,utf8_decode('Aldea/Caserío: '.$aldea_caserio),0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Barrio/Colonia: '.$barrio_colonia),0,1,'L',0);
}
//informacion especifica del proyecto
$pdf->SetX(70); 
$pdf->SetFont('Arial','U',11);
$pdf->cell(90, 10,strtoupper(utf8_decode('IV.Información Especifica Del Proyecto')),0,1,'C',0);
$pdf->SetFont('Arial','',11);

$pdf->cell(90, 10,utf8_decode('Objetivos de Desarrollo: '.$row['objetivos_desarrollo']),0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Objetivos Inmediatos: '.$row['objetivos_inmediatos']),0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Resultados Esperados: '.$row['resultados_esperados']),0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Lista de Actividades Principales: '.$row['actividades_principales']),0,1,'L',0);

$pdf->cell(90, 10,'',0,1,'C',0);
$pdf->cell(90, 10,'',0,1,'C',0);
$pdf->cell(90, 10,'',0,1,'C',0);
$pdf->cell(90, 10,'',0,1,'C',0);
$pdf->cell(90, 10,'',0,1,'C',0);
$pdf->cell(90, 10,'',0,1,'C',0);

$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
//firmas
$pdf->SetX(70); 
$pdf->SetFont('Arial','U',11);
$pdf->cell(90, 10,utf8_decode('V.FIRMAS'),0,1,'C',0);
$pdf->SetFont('Arial','',11);

$pdf->SetXY(22,170);
$pdf->cell(90, 10,'_____________________________________          _____________________________________',0,1,'L',0);
//$pdf->Image('imagenes/firmas.png',33,150,150,60,'');
$pdf->SetX(40);
$pdf->cell(90, 10,'Nombre,Firma y Sello                                                       Nombre y Firma',0,1,'L',0);
//contacto unah


//coordinador nombre 
$contadorcoordinador=1;
$sql13 = "SELECT * FROM tbl_docentes_proyecto WHERE Id_proyecto=$id";
$resultado13 = $mysqli->query($sql13);
while($row13 = $resultado13->fetch_assoc()){
$coordinador= $row13['nombre_coordinador'];
$direccion_coordinador= $row13['direccion_coordinador'];
$cargo_coordinador= $row13['cargo_coordinador'];
$celular_coordinador= $row13['celular_coordinador'];
$telefono_coordinador= $row13['telefono_coordinador'];
$correo_coordinador= $row13['correo_coordinador'];




$pdf->SetFont('Arial','',8);
$pdf->SetX(120);
$pdf->cell(90, 10,'Telefonos: '.$celular_coordinador.' / '.$telefono_coordinador,0,1,'L',0);
$pdf->SetX(120);
$pdf->cell(90, 10,utf8_decode('Correo Electronico: ').$correo_coordinador,0,1,'L',0);
}
//contacto empresa
//nombre de contacto


$sql9 = "SELECT nombre_contacto, id_empresa FROM tbl_mgp_contacto_empresa WHERE id_contacto_empresa=(SELECT id_contacto_empresa FROM tbl_mgp_empresa_proyecto WHERE id_proyecto=$id)";
$resultado9 = $mysqli->query($sql9);
while($row9 = $resultado9->fetch_assoc()){
$nombre_contacto = $row9['nombre_contacto'];
$id_em = $row9['id_empresa'];





//telefono/celular
$sql10 = "SELECT valor FROM tbl_mgp_contacto WHERE id_contacto_empresa=$id_em AND id_tip_contacto =5";
$resultado10 = $mysqli->query($sql10);
while($row10 = $resultado10->fetch_assoc()){
$celular = $row10['valor'];
}


//correo
$sql11 = "SELECT valor FROM tbl_mgp_contacto WHERE id_contacto_empresa=$id_em AND id_tip_contacto =2";
$resultado11 = $mysqli->query($sql11);
while($row11 = $resultado11->fetch_assoc()){
$correo= $row11['valor'];
}













$pdf->SetXY(25,190);
$pdf->cell(90, 10,'Telefonos: '.$celular,0,1,'L',0);
$pdf->SetXY(25,200);
$pdf->cell(90, 10,utf8_decode('Correo Electronico: ').$correo,0,1,'L',0);
}
$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
//anexos

$pdf->SetX(70); 
$pdf->SetFont('Arial','U',11);
$pdf->cell(90, 10,utf8_decode('VI.ANEXOS'),0,1,'C',0);
$pdf->SetFont('Arial','',11);

//municipio
$sql21 = "SELECT titulo,descripcion,id_tip_anexo FROM tbl_mgp_anexo WHERE id_proyecto=$id";
$resultado21 = $mysqli->query($sql21);
$contador=1;
while($row21 = $resultado21->fetch_assoc()){

$titulo_anexo=$row21['titulo'];
$descripcion_anexo=$row21['descripcion'];
$id_anexo=$row21['id_tip_anexo'];

$pdf->SetFont('Arial','U',11);
$pdf->cell(90, 10,'Anexo '.$contador,0,1,'L',0);
$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Titulo: '.$titulo_anexo),0,1,'L',0);
$pdf->cell(90, 10,utf8_decode('Descripción: '.$descripcion_anexo),0,1,'L',0);
//tipo de anexo
$sql22 = "SELECT nombre FROM tbl_mgp_tipanexo WHERE id_tip_anexo=$id_anexo";
$resultado22 = $mysqli->query($sql22);

while($row22 = $resultado22->fetch_assoc()){
    $anexo=$row22['nombre'];
$pdf->cell(90, 10,utf8_decode('Tipo de Anexo: '.$anexo),0,1,'L',0);
}
$contador++;
}
}






$pdf->Output();



/*else{
    
    $pdf = new PDF(); //crea el nuevo pdf
    $pdf -> AliasNbPages();//pie de pagina
    $pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
    $pdf->SetFont('Arial','U',16);//tipo de letra,estilo(b negrita,u subrayado) y tamaño
    
    $pdf->SetX(65); 
    $pdf->SetFont('Arial','',11);
    
    $pdf->cell(90, 10,'NO HA ELEGIDO O NO EXISTE PROYECTO',0,1,'C',0);
    $pdf->Output();
    }
    }*/

?>