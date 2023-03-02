@extends('layouts.app')

@section('css')
    <link href="{{ asset('admin/assets/extra-libs/datatables.net-bs4/css/dataTables.bootstrap4.css') }}" rel="stylesheet">
@endsection

@section('content')
<div class="modal fade" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title" id="modalEditTitle"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
              <div class="modalError"></div>
              <div id="modalEditContent"></div>
          </div>
      </div>
  </div>
</div>

<div class="modal fade" id="modalCreate" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h4 class="modal-title" id="modalCreateTitle"></h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <div class="modal-body">
              <div class="modalError"></div>
              <div id="modalCreateContent"></div>
          </div>
      </div>
  </div>
</div>

<div class="row">
	<div class="col-md-12">
      	<div class="card">
          	<div class="card-header">
          		<div style="float: left;">
          			<a href="#" value="{{ route('cpanel.create.kelas') }}" class="btn btn-success modalCreate" title="Buat Kelas" data-toggle="modal" data-target="#modalCreate"><i class="fas fa-user-plus"></i> &nbsp;Buat Kelas</a>
          		</div>
            	<h3 class="card-title text-primary" style="float: right;">
            		<i class="fa fa-briefcase"></i> Kelas
            	</h3>
        	</div>

			<div class="card-body">
				<table id="table" class="table table-bordered table-striped">
					<thead>
						<tr>
							<th style="width: 5%" class="center">No</th>
							<th class="center">Kelas</th>
							<th class="center">Tahun</th>
							<th class="center">Status</th>
							<th class="center">Mulai</th>
							<th class="center">Selesai</th>
							<th class="center"></th>
						</tr>
					</thead>
				</table>
			</div>
        </div>
    </div>
</div>
@endsection

@section('javascript')
    <script src="{{ asset('admin/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('admin/dist/js/pages/datatable/datatable-basic.init.js') }}"></script>
    <script>
    	$(document).ready(function(){
			$('#table').DataTable({
				processing: true,
				serverSide: true,
				ajax: '{!! route('cpanel.kelas') !!}',
				columns: [
		            { 
		                data: 'DT_RowIndex',
		                name: 'DT_RowIndex',
		                class: 'center',
		                orderable: false,
		                searchable: false
		            },
		            {
		                data: 'kelas',
		                name: 'kelas'
		            },
		            {
		                data: 'thn_akademik',
		                name: 'thn_akademik'
		            },
		            {
		                data: 'status',
		                name: 'status'
		            },
		            {
		                data: 'periode_awal',
		                name: 'periode_awal'
		            },
		            {
		                data: 'periode_akhir',
		                name: 'periode_akhir'
		            },
		            {
		                data: 'action',
		                name: 'action',
		                class: 'center',
		                orderable: false,
		                searchable: false
		            }
		        ]
			});
		});

    	setInterval(function(){
		    $('.modalEdit').off('click').on('click', function () {
		      $('#modalEdit').modal({backdrop: 'static', keyboard: false}) 
		      
		        $('#modalEditContent').load($(this).attr('value'));
		        $('#modalEditTitle').html($(this).attr('title'));
		    });	    

		    $('.modalCreate').off('click').on('click', function () {
		      $('#modalCreate').modal({backdrop: 'static', keyboard: false}) 
		      
		        $('#modalCreateContent').load($(this).attr('value'));
		        $('#modalCreateTitle').html($(this).attr('title'));
		    });
		  }, 500);
    </script>
@endsection