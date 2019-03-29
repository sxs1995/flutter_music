const base_url = 'https://c.y.qq.com';

const servicePath = {
  "homePageCarousel":
      base_url + '/musichall/fcgi-bin/fcg_yqqhomepagerecommend.fcg', //首页轮播
  "getHomeMusicList": base_url +
      '/splcloud/fcgi-bin/fcg_get_diss_by_tag.fcg?inCharset=utf-8&outCharset=utf-8&format=json&sortId=5&categoryId=10000000', //首页歌单列表
  "getRankList": base_url +
      '/v8/fcg-bin/fcg_myqq_toplist.fcg?g_tk=999222372&inCharset=utf-8&outCharset=utf-8&format=json', //排行列表
};
