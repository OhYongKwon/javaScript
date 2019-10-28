import chartConst from '../const';
import chartFactory from '../factories/chartFactory';
import BarChart from './barChart';
import ColumnChart from './columnChart';
import LineChart from './lineChart';
import AreaChart from './areaChart';
import ColumnLineComboChart from './columnLineComboChart';
import LineScatterComboChart from './lineScatterComboChart';
import LineAreaComboChart from './lineAreaComboChart';
import PieDonutComboChart from './pieDonutComboChart';
import PieChart from './pieChart';
import BubbleChart from './bubbleChart';
import ScatterChart from './scatterChart';
import HeatmapChart from './heatmapChart';
import TreemapChart from './treemapChart';
import MapChart from './mapChart';
import RadialChart from './radialChart';
import BoxplotChart from './boxplotChart';
import BulletChart from './bulletChart';

chartFactory.register(chartConst.CHART_TYPE_BAR, BarChart);
chartFactory.register(chartConst.CHART_TYPE_COLUMN, ColumnChart);
chartFactory.register(chartConst.CHART_TYPE_LINE, LineChart);
chartFactory.register(chartConst.CHART_TYPE_AREA, AreaChart);
chartFactory.register(chartConst.CHART_TYPE_COLUMN_LINE_COMBO, ColumnLineComboChart);
chartFactory.register(chartConst.CHART_TYPE_LINE_SCATTER_COMBO, LineScatterComboChart);
chartFactory.register(chartConst.CHART_TYPE_LINE_AREA_COMBO, LineAreaComboChart);
chartFactory.register(chartConst.CHART_TYPE_PIE_DONUT_COMBO, PieDonutComboChart);
chartFactory.register(chartConst.CHART_TYPE_PIE, PieChart);
chartFactory.register(chartConst.CHART_TYPE_BUBBLE, BubbleChart);
chartFactory.register(chartConst.CHART_TYPE_SCATTER, ScatterChart);
chartFactory.register(chartConst.CHART_TYPE_HEATMAP, HeatmapChart);
chartFactory.register(chartConst.CHART_TYPE_TREEMAP, TreemapChart);
chartFactory.register(chartConst.CHART_TYPE_MAP, MapChart);
chartFactory.register(chartConst.CHART_TYPE_RADIAL, RadialChart);
chartFactory.register(chartConst.CHART_TYPE_BOXPLOT, BoxplotChart);
chartFactory.register(chartConst.CHART_TYPE_BULLET, BulletChart);