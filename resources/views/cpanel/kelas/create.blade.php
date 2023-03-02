@section('content')
<form method="POST" action="{{ route('cpanel.store.kelas') }}" enctype="multipart/form-data">
@csrf
	<div class="modal-body">
		<strong>Nama Kelas</strong>
		<div class="form-group">
			<input type="text" name="kelas" placeholder="Nama Kelas" required class="form-control">
		</div>

		<strong>Deskripsi</strong>
		<div class="form-group">
			<textarea name="deskripsi" class="form-control" placeholder="Deskripsi Kelas" required></textarea>
		</div>

		<strong>Tahun</strong>
		<div class="form-group">
			<input type="text" name="thn_akademik" placeholder="Tahun" required class="form-control">
		</div>

		<div class="row">
			<div class="col-md-4">
				<strong>Periode</strong>
					<div class="form-group">
						<div class="form-group">
						    <div class="input-group">
						        <div class="input-group-prepend">
						            <span class="input-group-text"
						                ><i class="far fa-calendar-alt"></i
						            ></span>
						        </div>
						        <input
						            type="text"
						            class="form-control datepicker5"
						            name="periode"
						            data-date-format="yyyy-mm-dd" 
						            placeholder="2022-12-31"
						            required
						        />
						    </div>
						</div>
					</div>
			</div>

			<div class="col-md-4">
				<strong>Status</strong>
				<div class="form-group">
		            <input type="checkbox" name="status" checked data-bootstrap-switch data-off-color="danger" data-on-color="success">
				</div>
			</div>
			<div class="col-md-4">
				<strong>Foto</strong>
				<div class="form-group">
					<input type="file" name="files">
				</div>
			</div>
		</div>

		<strong>Daftar Siswa</strong>
		<div class="form-group">
			<a href="void::javascript(0);" id="addstudent" class="btn btn-success">
				<i class="fas fa-plus"></i>
			</a>
		</div>

		<div id="students">
		</div>
	</div>

	<div class="modal-footer">
		<div class="form-group">
			<button class="btn btn-primary" type="submit"><i class="fa fa-save"></i> Submit</button>
			<button class="btn btn-secondary" type="button" data-dismiss="modal"><i class="fa fa-undo"></i> Close</button>
		</div>
	</div>
</form>

<script>
	$(document).ready(function(){
		$("input[data-bootstrap-switch]").each(function(){
			$(this).bootstrapSwitch('state', $(this).prop('checked'));
		});

		$(".datepicker5").daterangepicker({
	    	autoclose: true,
	    });

	    $("#addstudent").on("click", function (e) {
			e.preventDefault();
			var newRow = $("<p>");
			var cols = "";

			// html
			cols = '<div class="form-group"> <div class="input-group"> <input type="text" class="form-control" name="nomor_induk_student[]" placeholder="Nomor Induk Murid" required> <input type="text" class="form-control" name="nama_student[]" placeholder="Nama Murid" required> <input type="text" class="form-control" name="nik_parent[]" placeholder="NIK Orang Tua" required> <div class="input-group-prepend"> <span style=""> <a href="void::javascript(0);" class="btn btn-danger ibtnDel"> <i class="fas fa-trash"></i> </a> </span> </div> </div> </div>';

			newRow.append(cols);
			$("#students").append(newRow);
		});

		$("#students").on("click", ".ibtnDel", function (event) {
			event.preventDefault();
			$(this).closest("p").remove();
		});
	});
</script>
@endsection