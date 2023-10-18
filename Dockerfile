FROM  alt:p10

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://www.python.org/ftp/python/3.10.13/Python-3.10.13.tgz
RUN tar zxvf Python-3.10.13.tgz
RUN cp -r Python-3.10.13 /usr/local/bin
WORKDIR /usr/local/bin/Python-3.10.13/
RUN apt-get install -y zlib-devel libssl-devel libsqlite3-devel libffi-devel gcc make
RUN apt-get install -y pip
RUN ./configure --prefix=/usr/local --with-ensurepip=install
RUN make
RUN make install
RUN make clean
RUN rm -rf /usr/local/bin/Python-3.10.13

# удаляем линки, чтобы они не пересекались с системным Python
WORKDIR /usr/local/bin/
RUN rm -f 2to3 idle3 pip3 pydoc3 python3 python3-config pyvenv
RUN rm -f /usr/local/lib/pkgconfig/python3.pc