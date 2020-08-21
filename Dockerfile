FROM bunsan/centos-elixir:1.10.3
ADD . /.
RUN ls -la
RUN yes | mix deps.get
RUN npm rebuild node-sass
RUN cd assets && npm install && node node_modules/webpack/bin/webpack.js --mode development
RUN cd ..
RUN mix deps.compile
ENTRYPOINT ["mix", "phx.server"]
