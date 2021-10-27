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
    $this->Ln(30);
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
$pdf->cell(90, 10,utf8_decode('Información Academica Del Proyecto'),0,1,'L',0);


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

    $pdf->cell(90, 10,utf8_decode('Tipo de Vinculación: '),0,1,'L',0);
    //traigo el tipo de vinculacion
   
   $sql5 = "SELECT id_vinculacion FROM tbl_mgp_vinculacion_proyecto INNER JOIN tbl_tip_vinculacion ON tbl_mgp_vinculacion_proyecto.id_vinculacion= tbl_tip_vinculacion.id_tipos_v  WHERE id_proyecto=$id";
    $resultado5 = $mysqli->query($sql5);
    while($row5 = $resultado5->fetch_assoc()){

    $pdf->cell(90, 10,$row5['id_vinculacion'],0,1,'L',0);

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
}

$pdf->SetFont('Arial','',11);
$pdf->cell(90, 10,utf8_decode('Nombre de la Entidad: ').$Entidad,0,1,'L',0);
$pdf->SetFont('Arial','',11);


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