<?php if ($_settings->chk_flashdata('success')) : ?>
	<script>
		alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
	</script>
<?php endif; ?>
<?php
$status = isset($_GET['status']) ? $_GET['status'] : '';
$stat_arr = ['Órdenes Pendientes', 'Órdenes Empacadas', 'Órdenes Listas Para Entrega', 'Órdenes Completadas']
?>
<div class="card card-outline rounded-0 card-dark">
	<div class="card-header">
		<h3 class="card-title">Todas las <?= isset($stat_arr[$status]) ? $stat_arr[$status] : 'Órdenes' ?></h3>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<table class="table table-hover table-striped table-bordered" id="list">
				<colgroup>
					<col width="5%">
					<col width="15%">
					<col width="15%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="p-1 text-center">#</th>
						<th class="p-1 text-center">Feche Orden</th>
						<th class="p-1 text-center">Código</th>
						<th class="p-1 text-center">Cliente</th>
						<th class="p-1 text-center">Monto Total</th>
						<th class="p-1 text-center">Estado</th>
						<th class="p-1 text-center">Acción</th>
					</tr>
				</thead>
				<tbody>
					<?php
					$i = 1;
					$where = "";
					switch ($status) {
						case 0:
							$where = " where o.`status` = 0 ";
							break;
						case 1:
							$where = " where o.`status` = 1 ";
							break;
						case 2:
							$where = " where o.`status` = 2 ";
							break;
						case 3:
							$where = " where o.`status` = 3 ";
							break;
					}
					$qry = $conn->query("SELECT o.*, CONCAT(c.firstname, ' ', COALESCE(concat(c.middlename, ' '), ''), c.lastname) as customer from `order_list` o inner join customer_list c on o.customer_id = c.id {$where} order by abs(unix_timestamp(o.date_created)) desc ");
					while ($row = $qry->fetch_assoc()) :
					?>
						<tr>
							<td class="p-1 align-middle text-center"><?= $i++ ?></td>
							<td class="p-1 align-middle"><?= date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
							<td class="p-1 align-middle"><?= $row['code'] ?></td>
							<td class="p-1 align-middle"><?= $row['customer'] ?></td>
							<td class="p-1 align-middle text-right"><?= format_num($row['total_amount'], 2) ?></td>
							<td class="p-1 align-middle text-center">
								<?php
								switch ($row['status']) {
									case 0:
										echo '<span class="badge badge-secondary bg-gradient-secondary px-3 rounded-pill">Pendiente</span>';
										break;
									case 1:
										echo '<span class="badge badge-primary bg-gradient-primary px-3 rounded-pill">Empacado</span>';
										break;
									case 2:
										echo '<span class="badge badge-warning bg-gradient-warning px-3 rounded-pill">Para entrega</span>';
										break;
									case 3:
										echo '<span class="badge badge-teal bg-gradient-teal px-3 rounded-pill">Pagado</span>';
										break;
								}
								?>
							</td>
							<td class="p-1 align-middle text-center">
								<a class="btn btn-flat btn-sm btn-light border-gradient-light border view-order" href="./?page=orders/view_order&id=<?= $row['id'] ?>"><i class="fa fa-eye text-dark"></i> Ver</a>
							</td>
						</tr>
					<?php endwhile; ?>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("¿Estás seguro de eliminar esta solicitud de forma permanente?", "delete_request", [$(this).attr('data-id')])
		})
		$('.table').dataTable({
			columnDefs: [{
				orderable: false,
				targets: [6]
			}],
			order: [0, 'asc']
		});
		$('.dataTable td,.dataTable th').addClass('py-1 px-2 align-middle')
	})
</script>