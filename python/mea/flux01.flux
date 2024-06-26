from(bucket: "test")
  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)
  |> filter(fn: (r) => r["_measurement"] == "power_meter")
  |> filter(fn: (r) => r["_field"] == "kw_t")
  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)
  |> yield(name: "mean")
  |> pivot(rowKey:["_time"], columnKey: ["_field"], valueColumn: "_value")