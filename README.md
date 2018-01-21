```
  ___  _       _                            
 / _ \| |     (_)                           
/ /_\ \ |_ __  _ _ __   ___                 
|  _  | | '_ \| | '_ \ / _ \                
| | | | | |_) | | | | |  __/                
\_| |_/_| .__/|_|_| |_|\___|                
        | |                                 
        |_|                                 
___  ___           _     _                  
|  \/  |          | |   (_)                 
| .  . | __ _  ___| |__  _ _ __   ___       
| |\/| |/ _` |/ __| '_ \| | '_ \ / _ \      
| |  | | (_| | (__| | | | | | | |  __/      
\_|  |_/\__,_|\___|_| |_|_|_| |_|\___|      
                                            
                                            
 _                           _              
| |                         (_)             
| |     ___  __ _ _ __ _ __  _ _ __   __ _  
| |    / _ \/ _` | '__| '_ \| | '_ \ / _` | 
| |___|  __/ (_| | |  | | | | | | | | (_| | 
\_____/\___|\__,_|_|  |_| |_|_|_| |_|\__, | 
                                      __/ | 
                                     |___/  
```
----------------------------------------------------------------------------------------

[![](https://images.microbadger.com/badges/image/petronetto/alpine-machine-learning-base.svg)](https://microbadger.com/images/petronetto/alpine-machine-learning-base "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/petronetto/alpine-machine-learning-base.svg)](https://microbadger.com/images/petronetto/alpine-machine-learning-base "Get your own version badge on microbadger.com")
[![GitHub issues](https://img.shields.io/github/issues/petronetto/alpine-machine-learning-base.svg)](https://github.com/petronetto/alpine-machine-learning-base/issues)
[![GitHub license](https://img.shields.io/github/license/petronetto/alpine-machine-learning-base.svg)](https://raw.githubusercontent.com/petronetto/alpine-machine-learning-base/master/LICENSE)
[![Twitter](https://img.shields.io/twitter/url/https/github.com/petronetto/alpine-machine-learning-base.svg?style=social)](https://twitter.com/intent/tweet?text=Wow:&url=https%3A%2F%2Fgithub.com%2Fpetronetto%2Falpine-machine-learning-base)


----------------------------------------------------------------------------------------

Container to build another containers for Machine Learning.

To reduce the contaner size do:

```Dockerfile
FROM petronetto/alpine-machine-learning-base
RUN apk del .build-deps \
    && rm /usr/include/xlocale.h \
    && rm -rf /root/.cache \
    && rm -rf /root/.[acpw]* \
    && rm -rf /var/cache/apk/* \
    && find /usr/lib/python3.6 -name __pycache__ | xargs rm -r
```
