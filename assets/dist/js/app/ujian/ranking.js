var table;

$(document).ready(function () {

    ajaxcsrf();

    table = $("#detail_hasil").DataTable({
        initComplete: function () {
            var api = this.api();
            $('#detail_hasil_filter input')
                .off('.DT')
                .on('keyup.DT', function (e) {
                    api.search(this.value).draw();
                });
        },
        oLanguage: {
            sProcessing: "loading..."
        },
        processing: true,
        serverSide: true,
        ajax: {
            "url": base_url + "hasilujian/RankingTo/"+id,
            "type": "POST",
        },
        columns: [
            {
                "data": "id",
                "orderable": false,
                "searchable": false
            },
            { "data": 'nama' },
            { "data": 'nilai_twk' },
        ],
        order: [
            [4, 'desc']
        ],
        rowId: function (a) {
            return a;
        },
        rowCallback: function (row, data, iDisplayIndex) {
            var info = this.fnPagingInfo();
            var page = info.iPage;
            var length = info.iLength;
            var index = page * length + (iDisplayIndex + 1);
            $('td:eq(0)', row).html(index);
        }
    });
});