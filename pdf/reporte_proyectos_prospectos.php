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
    $this->cell(0,6,utf8_decode('Listado de Proyectos Idea Prospecto de Vinculación'),0,0,'C',0);
    $this->Ln(15);
    //encabezado de la tabla 
    $this->cell(90, 10,'Nombre del Proyecto',1,1,'C',0);

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

$consulta2 = "SELECT id_estado FROM tbl_mgp_estado WHERE descripcion='IDEA PROSPECTO'";
$resultado2 = $mysqli->query($consulta2);
while($row = $resultado2->fetch_assoc()){ 
$id_estado=$row['id_estado'];
}
$consulta = "SELECT nom_proyecto FROM tbl_mgp_proyecto WHERE id_estado=$id_estado";
$resultado = $mysqli->query($consulta);

$pdf = new PDF(); //crea el nuevo pdf
$pdf -> AliasNbPages();//pie de pagina
$pdf->AddPage('portraid','letter');//*horientacion,tamaño y se le puede agregar una rotacion
$pdf->SetFont('Arial','U',16);//tipo de letra,estilo(b negrita,u subrayado) y tamaño


$pdf->SetFont('Arial','',11);




while($row = $resultado->fetch_assoc()){
    $pdf->cell(90, 10,$row['nom_proyecto'],1,1,'C',0);

    
}
$pdf->Output();

?>