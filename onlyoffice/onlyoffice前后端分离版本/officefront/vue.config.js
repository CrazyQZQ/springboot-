const path = require('path')
function resolve(dir) {
    return path.join(__dirname, dir)
}
module.exports = {
    configureWebpack: {
        resolve: {
            alias: {
                'assets': '@/assets',
                'components': '@/components',
                'views': '@/views',
            }
        }
    },
    //webpack - dev - server 的配置项
    devServer: {
        //   disableHostCheck: true,
        port: 8081,
        open: false, //配置自动启动浏览器
        proxy: {
            '/api': {
                target: 'http://localhost:8080', //对应自己的接口
                changeOrigin: true,
                ws: true,
                pathRewrite: { //是否移除api三个字段
                    '^/api': ''
                }
            }
        }
    },
    pluginOptions: { // 第三方插件配置
        'style-resources-loader': {
            preProcessor: 'less',
            patterns: [path.resolve(__dirname, './src/assets/css/globle.less')] // less所在文件路径
        }
    },
    // 部署应用时的基本 URL
    // baseUrl: process.env.NODE_ENV === 'production' ? 'https://api.xxxxxx.cn' : 'http://192.168.0.220',
    outputDir: 'dist',  // 构建输出目录
    assetsDir: 'static',// 静态资源目录 (js, css, img, fonts)
    runtimeCompiler: undefined,// 运行时版本是否需要编译
    productionSourceMap: false,// 是否在构建生产包时生成 sourceMap 文件，false将提高构建速度
    parallel: undefined,// 构建时开启多进程处理babel编译
    css: undefined, //配置编译css规则
    lintOnSave: false
} 