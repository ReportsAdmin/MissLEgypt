select StartDate, D_ga_internalPromotionId, D_ga_internalPromotionName,
D_ga_internalPromotionPosition,sum( cast(M_ga_internalPromotionClicks as int64)) as BannerClicks,
sum( cast(M_ga_internalPromotionViews as int64)) as BannerViews,'MissLEgypt' Halo_Country from
`noted-computing-279322.halo_1_1_Egypt.fGABanner`
group by 1,2,3,4,7