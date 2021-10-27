<?php
require('fpdf/fpdf.php');
session_start();
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
    $this->Ln(30);
    $this->SetFont('Arial','B',10);
    //$this->cell(0,6,'Fecha y Hora: ',0,0,'L',0);
    $this->cell(0,6,$fecha,0,1,'C',0);
    // Salto de línea
    $this->Ln(20);
    $this->SetFont('Arial','B',15);
    $this->cell(0,6,utf8_decode('Reporte de Estadisticas de Proyectos de Vinculación'),0,0,'C',0);
    $this->Ln(40);
    //encabezado de la tabla 
    $this->cell(90, 10,'Cantidad de Proyectos por Estado',1,1,'C',0);

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
//query para obtener cantidad de proyectos finalizados.......................
//se trae el id del estado finalizados
$consultaf = "SELECT id_estado FROM tbl_mgp_estado WHERE descripcion='FINALIZADO'";
$resultadof = $mysqli->query($consultaf);
while($rowf = $resultadof->fetch_assoc()){ 
$id_estadof=$rowf['id_estado'];
}
//se trae la cantidad de proyectos finalizados 
$consultacf = "SELECT COUNT(nom_proyecto) AS cantidad FROM tbl_mgp_proyecto WHERE id_estado=$id_estadof";
$resultadocf = $mysqli->query($consultacf);


while($rowcf = $resultadocf->fetch_assoc()){
    $finalizados=$rowcf['cantidad'];
}
//.................................................................................




//......................................................................................
//query para obtener cantidad de proyectos en ejecucion
//se trae el id del estado finalizados
$consultaej = "SELECT id_estado FROM tbl_mgp_estado WHERE descripcion='EN EJECUCION'";
$resultadoej = $mysqli->query($consultaej);
while($rowej = $resultadoej->fetch_assoc()){ 
$id_estadoej=$rowej['id_estado'];
}
//se trae la cantidad de proyectos finalizados 
$consultacej = "SELECT COUNT(nom_proyecto) AS cantidad FROM tbl_mgp_proyecto WHERE id_estado=$id_estadoej";
$resultadocej = $mysqli->query($consultacej);
while($rowcej = $resultadocej->fetch_assoc()){
    $ejecucion=$rowcej['cantidad'];
}
//...........................................................................................




//......................................................................................
//query para obtener cantidad de proyectos implementados
//se trae el id del estado implementados
$consultai = "SELECT id_estado FROM tbl_mgp_estado WHERE descripcion='IMPLEMENTADO'";
$resultadoi = $mysqli->query($consultai);
while($rowi = $resultadoi->fetch_assoc()){ 
$id_estadoi=$rowi['id_estado'];
}
//se trae la cantidad de proyectos implementados
$consultaci = "SELECT COUNT(nom_proyecto) AS cantidad FROM tbl_mgp_proyecto WHERE id_estado=$id_estadoi";
$resultadoci = $mysqli->query($consultaci);
while($rowci = $resultadoci->fetch_assoc()){
    $implementado=$rowci['cantidad'];
}
//...........................................................................................






//......................................................................................
//query para obtener cantidad de proyectos prospectos
//se trae el id del estado prospectos
$consultaip = "SELECT id_estado FROM tbl_mgp_estado WHERE descripcion='IDEA PROSPECTO'";
$resultadoip = $mysqli->query($consultaip);
while($rowip = $resultadoip->fetch_assoc()){ 
$id_estadoip=$rowip['id_estado'];
}
//se trae la cantidad de proyectos prospectos
$consultacip = "SELECT COUNT(nom_proyecto) AS cantidad FROM tbl_mgp_proyecto WHERE id_estado=$id_estadoip";
$resultadocip = $mysqli->query($consultacip);
while($rowcip = $resultadocip->fetch_assoc()){
    $prospecto=$rowcip['cantidad'];
}
//...........................................................................................





$pdf = new PDF(); //crea el nuevo pdf
$pdf -> AliasNbPages();//pie de pagina
$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
$pdf->SetFont('Arial','U',16);//tipo de letra,estilo(b negrita,u subrayado) y tamaño


$pdf->SetFont('Arial','',11);



$i=0;
do{ 
    $pdf->cell(90, 10,'FINALIZADOS: '.$finalizados,1,1,'C');
    $pdf->cell(90, 10,'EN EJECUCION: '.$ejecucion,1,1,'C');
    $pdf->cell(90, 10,'IMPLEMENTADOS: '.$implementado,1,1,'C');
    $pdf->cell(90, 10,'IDEAS PROSPECTO: '.$prospecto,1,1,'C');
    $i=$i+1;
}while($i==3);

$pdf->Output();

?>