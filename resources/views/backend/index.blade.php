@extends('backend.layouts.master')
@section('css')
<style>
    .dashboard-card {
        border-radius: 12px;
        padding: 24px 20px;
        color: #fff;
        min-width: 200px;
        min-height: 90px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.04);
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    .card-1 { background: #ff9472; }
    .card-2 { background: #00c9a7; }
    .card-3 { background: #ff6a88; }
    .card-4 { background: #00b8d9; }
    .dashboard-label { font-size: 14px; opacity: 0.85; }
    .dashboard-value { font-size: 22px; font-weight: bold; }
    .dashboard-update { font-size: 12px; opacity: 0.7; margin-top: 8px; }
</style>
@endsection
@section('content')
<div class="grid grid-cols-12 gap-6 mb-8">
    <div class="col-span-12 md:col-span-3">
        <div class="dashboard-card card-1">
            <div class="dashboard-value">{{ $total_song }}</div>
            <div class="dashboard-label">Tổng số bài hát</div>
            {{-- <div class="dashboard-update">&#128337; update: 2:15 am</div> --}}
        </div>
    </div>
    <div class="col-span-12 md:col-span-3">
        <div class="dashboard-card card-2">
            <div class="dashboard-value">{{ $total_user }}</div>
            <div class="dashboard-label">Tổng người dùng</div>
            {{-- <div class="dashboard-update">&#128337; update: 2:15 am</div> --}}
        </div>
    </div>
    <div class="col-span-12 md:col-span-3">
        <div class="dashboard-card card-3">
            <div class="dashboard-value">{{ $total_club }}</div>
            <div class="dashboard-label">Tổng câu lạc bộ</div>
            {{-- <div class="dashboard-update">&#128337; update: 2:15 am</div> --}}
        </div>
    </div>
    <div class="col-span-12 md:col-span-3">
        <div class="dashboard-card card-4">
            <div class="dashboard-value">{{ $total_post }}</div>
            <div class="dashboard-label">Tổng bài viết</div>
            {{-- <div class="dashboard-update">&#128337; update: 2:15 am</div> --}}
        </div>
    </div>
</div>
<div class="bg-white rounded-lg shadow p-6">
    <h2 class="text-lg font-semibold mb-4 text-center">Biểu đồ đường (Line Chart)</h2>
    <canvas id="zingLineChart" height="80"></canvas>
</div>
@endsection
@section('scripts')
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    const rawLabels = @json($array_title);

function truncateLabel(label, maxLen = 8) {
  return label.length > maxLen
    ? label.slice(0, maxLen) + '…'
    : label;
}

const ctx = document.getElementById('zingLineChart').getContext('2d');
const zingLineChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: rawLabels,
        datasets: [{
            label: 'Lượt nghe',
            data: @json($array_view),
            borderColor: '#a259ff',
            backgroundColor: 'rgba(96, 193, 249, 0.15)',
            pointBackgroundColor: '#fff',
            pointBorderColor: '#a259ff',
            pointRadius: 6,
            pointHoverRadius: 9,
            tension: 0.4,
            fill: true
        }]
    },
    options: {
        responsive: true,
        plugins: {
            legend: {
                display: false
            },
            tooltip: {
                backgroundColor: '#a259ff',
                titleColor: '#fff',
                bodyColor: '#fff',
                borderColor: '#fff',
                borderWidth: 1
            }
        },
        scales: {
            x: {
                ticks: { 
                    callback: function(value, index, ticks) {
                        const label = this.getLabelForValue(value);
                        return truncateLabel(label, 20);
                    },
                    autoSkip: true,
                    maxTicksLimit: 10,
                    color: '#aaa', font: { size: 13 } },
                grid: { color: '#23234a' }
            },
            y: {
                beginAtZero: true,
                ticks: { color: '#aaa', font: { size: 13 } },
                grid: { display:false }
            }
        }
    }
});
</script>
@endsection