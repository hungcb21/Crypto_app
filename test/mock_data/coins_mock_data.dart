const String mockCoinsData = r'''[
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
    "current_price": 66317,
    "market_cap": 1240713077017,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 1380944725976,
    "total_volume": 79537777257,
    "high_24h": 66572,
    "low_24h": 62061,
    "price_change_24h": 4256.23,
    "price_change_percentage_24h": 6.85817,
    "market_cap_change_24h": 68350293400,
    "market_cap_change_percentage_24h": 5.83013,
    "circulating_supply": 18867500,
    "total_supply": 21000000,
    "max_supply": 21000000,
    "ath": 67277,
    "ath_change_percentage": -1.62734,
    "ath_date": "2021-10-20T14:54:17.702Z",
    "atl": 67.81,
    "atl_change_percentage": 97500.57075,
    "atl_date": "2013-07-06T00:00:00.000Z",
    "roi": null,
    "last_updated": "2021-11-08T15:48:00.987Z",
    "sparkline_in_7d": {
      "price": [
        61482.2560967549,
        61580.79313827018,
        61173.140226698466,
        60866.87784481049,
        60722.187866776876,
        61115.849222694334,
        60767.15503356653,
        60950.81919978386,
        61185.32028943686,
        61041.978090123754,
        60876.48780327675,
        61452.74188087404,
        60924.190419927996,
        61233.63092009195,
        61531.74406378667,
        61844.2676749333,
        61761.714967045446,
        61641.40385445087,
        61822.54395425892,
        63190.855403568065,
        63307.488372484455,
        62987.769767352744,
        63076.21173129481,
        63374.059038093656,
        63347.24769842707,
        64210.946538040276,
        63734.54172644389,
        63401.65592086216,
        63262.09113062689,
        63447.7831689639,
        63082.31190299051,
        63035.316595594,
        62954.45230044289,
        63247.20896127831,
        63179.87443160166,
        63118.19119432422,
        63203.537048534505,
        63247.96665809771,
        62796.683162512534,
        63079.861061973796,
        62881.96930421115,
        63334.901995172506,
        62972.59011053353,
        63128.46555273844,
        63080.77220123498,
        63084.473736271495,
        62407.67630880006,
        61960.59991586665,
        61947.97447039592,
        62123.39456981871,
        61989.75354828344,
        62385.62933497076,
        63546.46431329936,
        62951.139765324166,
        62819.57916906263,
        63205.48087302269,
        62913.67925050198,
        63025.089675660354,
        62777.08326770822,
        62456.91519166142,
        62528.25158619306,
        62505.901457522195,
        62808.08201787362,
        62433.79048195037,
        62546.944925603355,
        62151.16858724885,
        61615.31213421733,
        61710.50558538645,
        61933.21836516382,
        61509.8940899176,
        61831.74246815894,
        62087.6985464445,
        61949.0347033761,
        61107.24410557137,
        61289.12276238107,
        61063.50455405976,
        61068.71052070529,
        61415.79504946111,
        61399.26396123574,
        61467.7903297479,
        61325.80282302198,
        61585.725989000144,
        60931.950483409666,
        61580.783053572006,
        61850.95728653431,
        62446.852968507075,
        62257.80290453922,
        62244.83439675593,
        62468.87743148102,
        62392.63836113747,
        62256.751394226485,
        61681.32392138866,
        61600.74038675532,
        61501.93398805289,
        61642.910634806896,
        62024.50581138371,
        61509.42663304429,
        61052.47721290983,
        61051.689363378595,
        61145.40226988245,
        61350.524752413774,
        61176.99699329711,
        61149.96470774504,
        61275.14697812769,
        61275.7805576767,
        61247.38494217787,
        61415.72232750781,
        61382.68284988165,
        61167.98536027259,
        61257.140300555606,
        61401.68986847362,
        61634.28254184476,
        61404.259948896004,
        61042.427553789545,
        61237.04495889948,
        61203.17432305651,
        60781.206862817606,
        60529.50622992756,
        60493.36613444398,
        60726.4869728972,
        60903.717023248355,
        60958.906242839126,
        60796.83040710179,
        60953.29606971263,
        60996.86695910914,
        61341.30796741526,
        61378.239816543246,
        61610.83875459432,
        61566.480378170265,
        61682.551073522554,
        62396.75326061355,
        61993.36517453731,
        62221.72855909265,
        62370.71201742011,
        62389.05373707468,
        62193.68335748939,
        62036.303972440524,
        61962.814229250136,
        61999.57837579247,
        62167.42946006294,
        62039.02523491696,
        62017.52144862568,
        62097.152761341,
        62166.712349193454,
        61999.129229523016,
        62208.17300935788,
        62351.39539503783,
        62522.222520115494,
        62590.769954374744,
        62447.41536175135,
        62916.93883108815,
        63005.03947881222,
        63036.736127182565,
        63432.566870410454,
        65058.3519486148,
        65268.41208068035,
        65335.76855149814,
        65317.59830533633,
        65379.67347675058,
        65647.25241994597,
        66342.15829314454,
        65934.95443840112,
        66121.15261786306,
        66509.5876232143,
        66259.61406087133,
        66160.1251599846,
        66130.251833762,
        66068.76531261054,
        65617.79736527929
      ]
    }
  },
  {
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image": "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1595348880",
    "current_price": 4779.69,
    "market_cap": 561526271110,
    "market_cap_rank": 2,
    "fully_diluted_valuation": null,
    "total_volume": 19957593243,
    "high_24h": 4782.42,
    "low_24h": 4600.02,
    "price_change_24h": 175.1,
    "price_change_percentage_24h": 3.80268,
    "market_cap_change_24h": 15176978951,
    "market_cap_change_percentage_24h": 2.77789,
    "circulating_supply": 118259710.374,
    "total_supply": null,
    "max_supply": null,
    "ath": 4782.42,
    "ath_change_percentage": -0.10084,
    "ath_date": "2021-11-08T06:49:30.573Z",
    "atl": 0.432979,
    "atl_change_percentage": 1103325.48285,
    "atl_date": "2015-10-20T00:00:00.000Z",
    "roi": {
      "times": 95.50374535498415,
      "currency": "btc",
      "percentage": 9550.374535498415
    },
    "last_updated": "2021-11-08T15:47:52.589Z",
    "sparkline_in_7d": {
      "price": [
        4330.258515114744,
        4347.875001142147,
        4318.534176367338,
        4291.415002088074,
        4302.051555108144,
        4346.920384255765,
        4321.265342822731,
        4310.424186666718,
        4325.1209411048,
        4330.553151595248,
        4303.608006777157,
        4331.950445621059,
        4308.144233062116,
        4330.658817178578,
        4358.310185777084,
        4372.9174187486215,
        4376.538491463792,
        4351.567705044042,
        4362.573518057718,
        4459.513339476671,
        4452.390668457816,
        4421.726752278397,
        4439.3056096282135,
        4481.630383658978,
        4470.7642680828285,
        4519.476306681931,
        4502.00306392949,
        4475.904986827509,
        4494.286766603283,
        4506.147901246595,
        4499.696662622929,
        4514.837472189726,
        4539.854184560868,
        4596.59309058429,
        4594.194009870491,
        4605.040739668634,
        4597.337021579394,
        4591.554800882311,
        4545.564329217457,
        4560.975239775955,
        4557.450820970056,
        4603.819189406006,
        4583.802852790411,
        4595.3390173349735,
        4577.494204053764,
        4571.814682495647,
        4522.947631970118,
        4495.233933069995,
        4503.257470228544,
        4536.038550275683,
        4516.957792329754,
        4542.961100467179,
        4674.899532893563,
        4630.860051522411,
        4616.932034367302,
        4618.343370037159,
        4596.793736286311,
        4604.559025470852,
        4566.633145669757,
        4564.657175916813,
        4571.6691219633885,
        4558.050494245411,
        4584.008363955138,
        4550.21670194872,
        4570.290266435814,
        4535.072791809628,
        4518.0209743366,
        4517.891181866486,
        4533.652511397096,
        4509.005435059714,
        4537.63338151829,
        4545.773039566829,
        4551.795342538369,
        4499.493760263832,
        4479.571642238193,
        4460.006204883535,
        4467.141742861807,
        4495.245215216571,
        4515.85038614237,
        4529.672749705666,
        4530.905581175254,
        4549.325863768297,
        4479.99923750714,
        4525.4064922448015,
        4522.300295339357,
        4565.3904043133525,
        4543.57875851251,
        4543.737190127753,
        4555.8392861462435,
        4549.109257969231,
        4541.776602553649,
        4512.315569756757,
        4502.659363671597,
        4496.622751407384,
        4505.666345084881,
        4536.315596822206,
        4483.414938240907,
        4478.201534866372,
        4492.851005505484,
        4485.779904733945,
        4513.931529060557,
        4504.531530018207,
        4474.176770488677,
        4478.382482272411,
        4492.023731848035,
        4495.668186253852,
        4501.710315810788,
        4513.829783789372,
        4495.895622307088,
        4504.231663728067,
        4498.472207871523,
        4524.841948110969,
        4501.599006937604,
        4485.437340960459,
        4488.794462583725,
        4482.981584806029,
        4427.469793844779,
        4394.055981236257,
        4372.080255841448,
        4403.981544127066,
        4417.629269941014,
        4420.710144326526,
        4411.811356285239,
        4439.392514637777,
        4456.293654332249,
        4495.173605383151,
        4499.905212436269,
        4535.378145669151,
        4522.319595191709,
        4529.850004368157,
        4570.942170841363,
        4559.212768535094,
        4568.917968289622,
        4568.004190543472,
        4569.419399180037,
        4558.23378340509,
        4561.756216561412,
        4559.018681261986,
        4566.653681239641,
        4602.7258358779445,
        4596.186492173202,
        4602.931151665562,
        4618.127687600529,
        4620.657150798436,
        4624.400913663007,
        4616.450653438931,
        4613.994044625738,
        4618.058499706772,
        4623.442601725463,
        4620.312436368367,
        4638.640177245084,
        4638.272280328031,
        4620.96587741324,
        4626.6292884486975,
        4711.866911356413,
        4711.8422054358,
        4713.970835618066,
        4736.587154281582,
        4733.527058411852,
        4739.318795959086,
        4769.790903525311,
        4739.744253958692,
        4744.656852405347,
        4767.958876908934,
        4735.183244585485,
        4746.404445720074,
        4743.867908593495,
        4745.034104511656,
        4729.196842305549
      ]
    }
  }
]''';