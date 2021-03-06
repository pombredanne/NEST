# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_P="${PN}-v${PV}"
EGIT_REPO_URI="https://gitlab.com/gitlab-org/gitlab-test.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${MY_P}/testdata/data/group/test.git"
EGIT_SUBMODULES=()

inherit git-r3 go-module systemd tmpfiles

EGO_SUM=(
	"cloud.google.com/go v0.26.0"
	"cloud.google.com/go v0.26.0/go.mod"
	"cloud.google.com/go v0.34.0/go.mod"
	"cloud.google.com/go v0.38.0/go.mod"
	"cloud.google.com/go v0.44.1/go.mod"
	"cloud.google.com/go v0.44.2/go.mod"
	"cloud.google.com/go v0.45.1/go.mod"
	"cloud.google.com/go v0.46.3/go.mod"
	"cloud.google.com/go v0.50.0"
	"cloud.google.com/go v0.50.0/go.mod"
	"cloud.google.com/go/bigquery v1.0.1"
	"cloud.google.com/go/bigquery v1.0.1/go.mod"
	"cloud.google.com/go/datastore v1.0.0"
	"cloud.google.com/go/datastore v1.0.0/go.mod"
	"cloud.google.com/go/pubsub v1.0.1"
	"cloud.google.com/go/pubsub v1.0.1/go.mod"
	"cloud.google.com/go/storage v1.0.0"
	"cloud.google.com/go/storage v1.0.0/go.mod"
	"dmitri.shuralyov.com/gpu/mtl v0.0.0-20190408044501-666a987793e9/go.mod"
	"github.com/AndreasBriese/bbloom v0.0.0-20190306092124-e2d15f34fcf9/go.mod"
	"github.com/BurntSushi/toml v0.3.1"
	"github.com/BurntSushi/toml v0.3.1/go.mod"
	"github.com/BurntSushi/xgb v0.0.0-20160522181843-27f122750802/go.mod"
	"github.com/CloudyKit/fastprinter v0.0.0-20170127035650-74b38d55f37a/go.mod"
	"github.com/CloudyKit/jet v2.1.3-0.20180809161101-62edd43e4f88+incompatible/go.mod"
	"github.com/FZambia/sentinel v1.0.0"
	"github.com/FZambia/sentinel v1.0.0/go.mod"
	"github.com/Joker/hpp v0.0.0-20180418125244-6893e659854a/go.mod"
	"github.com/Joker/hpp v1.0.0/go.mod"
	"github.com/Joker/jade v1.0.0/go.mod"
	"github.com/Joker/jade v1.0.1-0.20190614124447-d475f43051e7/go.mod"
	"github.com/Shopify/goreferrer v0.0.0-20181106222321-ec9c9a553398/go.mod"
	"github.com/ajg/form v1.5.1/go.mod"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38"
	"github.com/alecthomas/assert v0.0.0-20170929043011-405dbfeb8e38/go.mod"
	"github.com/alecthomas/chroma v0.7.3"
	"github.com/alecthomas/chroma v0.7.3/go.mod"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721"
	"github.com/alecthomas/colour v0.0.0-20160524082231-60882d9e2721/go.mod"
	"github.com/alecthomas/kong v0.2.4/go.mod"
	"github.com/alecthomas/repr v0.0.0-20180818092828-117648cd9897"
	"github.com/alecthomas/repr v0.0.0-20180818092828-117648cd9897/go.mod"
	"github.com/alecthomas/template v0.0.0-20160405071501-a0175ee3bccc/go.mod"
	"github.com/alecthomas/units v0.0.0-20151022065526-2efee857e7cf/go.mod"
	"github.com/armon/consul-api v0.0.0-20180202201655-eb2c6b5be1b6/go.mod"
	"github.com/aws/aws-sdk-go v1.17.4/go.mod"
	"github.com/aws/aws-sdk-go v1.31.7"
	"github.com/aws/aws-sdk-go v1.31.7/go.mod"
	"github.com/aymerick/raymond v2.0.2+incompatible/go.mod"
	"github.com/aymerick/raymond v2.0.3-0.20180322193309-b565731e1464+incompatible/go.mod"
	"github.com/beorn7/perks v0.0.0-20180321164747-3a771d992973/go.mod"
	"github.com/beorn7/perks v1.0.0"
	"github.com/beorn7/perks v1.0.0/go.mod"
	"github.com/boltdb/bolt v1.3.1/go.mod"
	"github.com/certifi/gocertifi v0.0.0-20180905225744-ee1a9a0726d2"
	"github.com/certifi/gocertifi v0.0.0-20180905225744-ee1a9a0726d2/go.mod"
	"github.com/chzyer/logex v1.1.10/go.mod"
	"github.com/chzyer/readline v0.0.0-20180603132655-2972be24d48e/go.mod"
	"github.com/chzyer/test v0.0.0-20180213035817-a1ea475d72b1/go.mod"
	"github.com/client9/misspell v0.3.4/go.mod"
	"github.com/client9/reopen v1.0.0"
	"github.com/client9/reopen v1.0.0/go.mod"
	"github.com/cloudflare/tableflip v0.0.0-20190329062924-8392f1641731/go.mod"
	"github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd"
	"github.com/codahale/hdrhistogram v0.0.0-20161010025455-3a0bb77429bd/go.mod"
	"github.com/codegangsta/inject v0.0.0-20150114235600-33e0aa1cb7c0/go.mod"
	"github.com/coreos/etcd v3.3.10+incompatible/go.mod"
	"github.com/coreos/go-etcd v2.0.0+incompatible/go.mod"
	"github.com/coreos/go-semver v0.2.0/go.mod"
	"github.com/cpuguy83/go-md2man v1.0.10/go.mod"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964/go.mod"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/dgraph-io/badger v1.6.0/go.mod"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible"
	"github.com/dgrijalva/jwt-go v3.2.0+incompatible/go.mod"
	"github.com/dgryski/go-farm v0.0.0-20190423205320-6a90982ecee2/go.mod"
	"github.com/dlclark/regexp2 v1.2.0"
	"github.com/dlclark/regexp2 v1.2.0/go.mod"
	"github.com/dustin/go-humanize v1.0.0/go.mod"
	"github.com/eknkc/amber v0.0.0-20171010120322-cdade1c07385/go.mod"
	"github.com/etcd-io/bbolt v1.3.3/go.mod"
	"github.com/fasthttp-contrib/websocket v0.0.0-20160511215533-1f3b11f56072/go.mod"
	"github.com/fatih/structs v1.1.0/go.mod"
	"github.com/flosch/pongo2 v0.0.0-20190707114632-bbf5a6c351f4/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/gavv/httpexpect v2.0.0+incompatible/go.mod"
	"github.com/gavv/monotime v0.0.0-20190418164738-30dba4353424/go.mod"
	"github.com/getsentry/raven-go v0.1.0/go.mod"
	"github.com/getsentry/raven-go v0.1.2"
	"github.com/getsentry/raven-go v0.1.2/go.mod"
	"github.com/getsentry/sentry-go v0.3.0"
	"github.com/getsentry/sentry-go v0.3.0/go.mod"
	"github.com/getsentry/sentry-go v0.5.1"
	"github.com/getsentry/sentry-go v0.5.1/go.mod"
	"github.com/gin-contrib/sse v0.0.0-20190301062529-5545eab6dad3/go.mod"
	"github.com/gin-gonic/gin v1.4.0/go.mod"
	"github.com/go-check/check v0.0.0-20180628173108-788fd7840127/go.mod"
	"github.com/go-errors/errors v1.0.1"
	"github.com/go-errors/errors v1.0.1/go.mod"
	"github.com/go-gl/glfw/v3.3/glfw v0.0.0-20191125211704-12ad95a8df72/go.mod"
	"github.com/go-kit/kit v0.8.0/go.mod"
	"github.com/go-logfmt/logfmt v0.3.0/go.mod"
	"github.com/go-martini/martini v0.0.0-20170121215854-22fa46961aab/go.mod"
	"github.com/go-sql-driver/mysql v1.5.0/go.mod"
	"github.com/go-stack/stack v1.8.0/go.mod"
	"github.com/gobwas/httphead v0.0.0-20180130184737-2c6c146eadee/go.mod"
	"github.com/gobwas/pool v0.2.0/go.mod"
	"github.com/gobwas/ws v1.0.2/go.mod"
	"github.com/gogo/protobuf v1.1.1"
	"github.com/gogo/protobuf v1.1.1/go.mod"
	"github.com/golang/gddo v0.0.0-20190419222130-af0f2af80721"
	"github.com/golang/gddo v0.0.0-20190419222130-af0f2af80721/go.mod"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b"
	"github.com/golang/glog v0.0.0-20160126235308-23def4e6c14b/go.mod"
	"github.com/golang/groupcache v0.0.0-20190702054246-869f871628b6/go.mod"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7"
	"github.com/golang/groupcache v0.0.0-20191227052852-215e87163ea7/go.mod"
	"github.com/golang/lint v0.0.0-20180702182130-06c8688daad7/go.mod"
	"github.com/golang/mock v1.1.1/go.mod"
	"github.com/golang/mock v1.2.0/go.mod"
	"github.com/golang/mock v1.3.1"
	"github.com/golang/mock v1.3.1/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/gomodule/redigo v1.7.1-0.20190724094224-574c33c3df38/go.mod"
	"github.com/gomodule/redigo v2.0.0+incompatible"
	"github.com/gomodule/redigo v2.0.0+incompatible/go.mod"
	"github.com/google/btree v0.0.0-20180813153112-4030bb1f1f0c/go.mod"
	"github.com/google/btree v1.0.0/go.mod"
	"github.com/google/go-cmp v0.2.0/go.mod"
	"github.com/google/go-cmp v0.3.0/go.mod"
	"github.com/google/go-cmp v0.4.0"
	"github.com/google/go-cmp v0.4.0/go.mod"
	"github.com/google/go-querystring v1.0.0/go.mod"
	"github.com/google/martian v2.1.0+incompatible"
	"github.com/google/martian v2.1.0+incompatible/go.mod"
	"github.com/google/pprof v0.0.0-20181206194817-3ea8567a2e57/go.mod"
	"github.com/google/pprof v0.0.0-20190515194954-54271f7e092f/go.mod"
	"github.com/google/pprof v0.0.0-20191218002539-d4f498aebedc"
	"github.com/google/pprof v0.0.0-20191218002539-d4f498aebedc/go.mod"
	"github.com/google/renameio v0.1.0/go.mod"
	"github.com/google/uuid v1.1.1"
	"github.com/google/uuid v1.1.1/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.4/go.mod"
	"github.com/googleapis/gax-go/v2 v2.0.5"
	"github.com/googleapis/gax-go/v2 v2.0.5/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gorilla/schema v1.1.0/go.mod"
	"github.com/gorilla/websocket v1.4.0"
	"github.com/gorilla/websocket v1.4.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0"
	"github.com/grpc-ecosystem/go-grpc-middleware v1.0.0/go.mod"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0"
	"github.com/grpc-ecosystem/go-grpc-prometheus v1.2.0/go.mod"
	"github.com/hashicorp/go-version v1.2.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.0/go.mod"
	"github.com/hashicorp/golang-lru v0.5.1/go.mod"
	"github.com/hashicorp/hcl v1.0.0/go.mod"
	"github.com/hpcloud/tail v1.0.0"
	"github.com/hpcloud/tail v1.0.0/go.mod"
	"github.com/ianlancetaylor/demangle v0.0.0-20181102032728-5e5cf60278f6/go.mod"
	"github.com/imkira/go-interpol v1.1.0/go.mod"
	"github.com/inconshreveable/mousetrap v1.0.0/go.mod"
	"github.com/iris-contrib/blackfriday v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/formBinder v5.0.0+incompatible/go.mod"
	"github.com/iris-contrib/go.uuid v2.0.0+incompatible/go.mod"
	"github.com/iris-contrib/httpexpect v0.0.0-20180314041918-ebe99fcebbce/go.mod"
	"github.com/iris-contrib/i18n v0.0.0-20171121225848-987a633949d0/go.mod"
	"github.com/iris-contrib/schema v0.0.1/go.mod"
	"github.com/jfbus/httprs v0.0.0-20190827093123-b0af8319bb15"
	"github.com/jfbus/httprs v0.0.0-20190827093123-b0af8319bb15/go.mod"
	"github.com/jmespath/go-jmespath v0.0.0-20180206201540-c2b33e8439af/go.mod"
	"github.com/jmespath/go-jmespath v0.3.0"
	"github.com/jmespath/go-jmespath v0.3.0/go.mod"
	"github.com/johannesboyne/gofakes3 v0.0.0-20200510090907-02d71f533bec"
	"github.com/johannesboyne/gofakes3 v0.0.0-20200510090907-02d71f533bec/go.mod"
	"github.com/jpillora/backoff v0.0.0-20170918002102-8eab2debe79d"
	"github.com/jpillora/backoff v0.0.0-20170918002102-8eab2debe79d/go.mod"
	"github.com/json-iterator/go v1.1.6/go.mod"
	"github.com/jstemmer/go-junit-report v0.0.0-20190106144839-af01ea7f8024/go.mod"
	"github.com/jstemmer/go-junit-report v0.9.1"
	"github.com/jstemmer/go-junit-report v0.9.1/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/juju/errors v0.0.0-20181118221551-089d3ea4e4d5/go.mod"
	"github.com/juju/loggo v0.0.0-20180524022052-584905176618/go.mod"
	"github.com/juju/testing v0.0.0-20180920084828-472a3e8b2073/go.mod"
	"github.com/julienschmidt/httprouter v1.2.0/go.mod"
	"github.com/k0kubun/colorstring v0.0.0-20150214042306-9440f1994b88/go.mod"
	"github.com/kataras/golog v0.0.0-20190624001437-99c81de45f40/go.mod"
	"github.com/kataras/golog v0.0.9/go.mod"
	"github.com/kataras/iris v11.1.1+incompatible/go.mod"
	"github.com/kataras/iris/v12 v12.0.1/go.mod"
	"github.com/kataras/neffos v0.0.10/go.mod"
	"github.com/kataras/pio v0.0.0-20190103105442-ea782b38602d/go.mod"
	"github.com/kelseyhightower/envconfig v1.3.0"
	"github.com/kelseyhightower/envconfig v1.3.0/go.mod"
	"github.com/kisielk/gotool v1.0.0/go.mod"
	"github.com/klauspost/compress v1.4.0/go.mod"
	"github.com/klauspost/compress v1.8.2/go.mod"
	"github.com/klauspost/compress v1.9.0/go.mod"
	"github.com/klauspost/cpuid v0.0.0-20180405133222-e7e905edc00e/go.mod"
	"github.com/klauspost/cpuid v1.2.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1/go.mod"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.2/go.mod"
	"github.com/kr/logfmt v0.0.0-20140226030751-b84e30acd515/go.mod"
	"github.com/kr/pretty v0.1.0"
	"github.com/kr/pretty v0.1.0/go.mod"
	"github.com/kr/pty v1.1.1/go.mod"
	"github.com/kr/text v0.1.0"
	"github.com/kr/text v0.1.0/go.mod"
	"github.com/labstack/echo/v4 v4.1.10/go.mod"
	"github.com/labstack/echo/v4 v4.1.11/go.mod"
	"github.com/labstack/gommon v0.3.0/go.mod"
	"github.com/libgit2/git2go v0.0.0-20190104134018-ecaeb7a21d47/go.mod"
	"github.com/lightstep/lightstep-tracer-go v0.15.6"
	"github.com/lightstep/lightstep-tracer-go v0.15.6/go.mod"
	"github.com/magiconair/properties v1.8.0/go.mod"
	"github.com/mattn/go-colorable v0.1.2/go.mod"
	"github.com/mattn/go-colorable v0.1.6/go.mod"
	"github.com/mattn/go-isatty v0.0.7/go.mod"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-isatty v0.0.9/go.mod"
	"github.com/mattn/go-isatty v0.0.12"
	"github.com/mattn/go-isatty v0.0.12/go.mod"
	"github.com/mattn/goveralls v0.0.2/go.mod"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1/go.mod"
	"github.com/mediocregopher/mediocre-go-lib v0.0.0-20181029021733-cb65787f37ed/go.mod"
	"github.com/mediocregopher/radix/v3 v3.3.0/go.mod"
	"github.com/microcosm-cc/bluemonday v1.0.2/go.mod"
	"github.com/mitchellh/copystructure v1.0.0"
	"github.com/mitchellh/copystructure v1.0.0/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/mitchellh/mapstructure v1.1.2/go.mod"
	"github.com/mitchellh/reflectwalk v1.0.0"
	"github.com/mitchellh/reflectwalk v1.0.0/go.mod"
	"github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd/go.mod"
	"github.com/modern-go/reflect2 v1.0.1/go.mod"
	"github.com/moul/http2curl v1.0.0/go.mod"
	"github.com/mwitkow/go-conntrack v0.0.0-20161129095857-cc309e4a2223/go.mod"
	"github.com/nats-io/nats.go v1.8.1/go.mod"
	"github.com/nats-io/nkeys v0.0.2/go.mod"
	"github.com/nats-io/nuid v1.0.1/go.mod"
	"github.com/onsi/ginkgo v1.6.0/go.mod"
	"github.com/onsi/ginkgo v1.7.0"
	"github.com/onsi/ginkgo v1.7.0/go.mod"
	"github.com/onsi/ginkgo v1.10.1"
	"github.com/onsi/ginkgo v1.10.1/go.mod"
	"github.com/onsi/ginkgo v1.10.3"
	"github.com/onsi/ginkgo v1.10.3/go.mod"
	"github.com/onsi/gomega v1.4.3"
	"github.com/onsi/gomega v1.4.3/go.mod"
	"github.com/onsi/gomega v1.7.0"
	"github.com/onsi/gomega v1.7.0/go.mod"
	"github.com/onsi/gomega v1.7.1"
	"github.com/onsi/gomega v1.7.1/go.mod"
	"github.com/opentracing/opentracing-go v1.0.2"
	"github.com/opentracing/opentracing-go v1.0.2/go.mod"
	"github.com/pelletier/go-toml v1.2.0/go.mod"
	"github.com/philhofer/fwd v1.0.0"
	"github.com/philhofer/fwd v1.0.0/go.mod"
	"github.com/pingcap/errors v0.11.1"
	"github.com/pingcap/errors v0.11.1/go.mod"
	"github.com/pingcap/errors v0.11.4"
	"github.com/pingcap/errors v0.11.4/go.mod"
	"github.com/pkg/errors v0.8.0"
	"github.com/pkg/errors v0.8.0/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pkg/errors v0.9.1"
	"github.com/pkg/errors v0.9.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/prometheus/client_golang v0.9.1/go.mod"
	"github.com/prometheus/client_golang v1.0.0"
	"github.com/prometheus/client_golang v1.0.0/go.mod"
	"github.com/prometheus/client_model v0.0.0-20180712105110-5c3871d89910/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90"
	"github.com/prometheus/client_model v0.0.0-20190129233127-fd36f4220a90/go.mod"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4"
	"github.com/prometheus/client_model v0.0.0-20190812154241-14fe0d1b01d4/go.mod"
	"github.com/prometheus/common v0.4.1"
	"github.com/prometheus/common v0.4.1/go.mod"
	"github.com/prometheus/procfs v0.0.0-20181005140218-185b4288413d/go.mod"
	"github.com/prometheus/procfs v0.0.2"
	"github.com/prometheus/procfs v0.0.2/go.mod"
	"github.com/rafaeljusto/redigomock v0.0.0-20190202135759-257e089e14a1"
	"github.com/rafaeljusto/redigomock v0.0.0-20190202135759-257e089e14a1/go.mod"
	"github.com/rogpeppe/go-internal v1.3.0/go.mod"
	"github.com/russross/blackfriday v1.5.2/go.mod"
	"github.com/ryanuber/columnize v2.1.0+incompatible/go.mod"
	"github.com/ryszard/goskiplist v0.0.0-20150312221310-2dfbae5fcf46"
	"github.com/ryszard/goskiplist v0.0.0-20150312221310-2dfbae5fcf46/go.mod"
	"github.com/sebest/xff v0.0.0-20160910043805-6c115e0ffa35"
	"github.com/sebest/xff v0.0.0-20160910043805-6c115e0ffa35/go.mod"
	"github.com/sergi/go-diff v1.0.0"
	"github.com/sergi/go-diff v1.0.0/go.mod"
	"github.com/shabbyrobe/gocovmerge v0.0.0-20180507124511-f6ea450bfb63"
	"github.com/shabbyrobe/gocovmerge v0.0.0-20180507124511-f6ea450bfb63/go.mod"
	"github.com/shabbyrobe/gocovmerge v0.0.0-20190829150210-3e036491d500"
	"github.com/shabbyrobe/gocovmerge v0.0.0-20190829150210-3e036491d500/go.mod"
	"github.com/shurcooL/sanitized_anchor_name v1.0.0/go.mod"
	"github.com/sirupsen/logrus v1.2.0/go.mod"
	"github.com/sirupsen/logrus v1.3.0"
	"github.com/sirupsen/logrus v1.3.0/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/goconvey v0.0.0-20190731233626-505e41936337"
	"github.com/smartystreets/goconvey v0.0.0-20190731233626-505e41936337/go.mod"
	"github.com/smartystreets/goconvey v1.6.4"
	"github.com/smartystreets/goconvey v1.6.4/go.mod"
	"github.com/spf13/afero v1.1.2/go.mod"
	"github.com/spf13/afero v1.2.1/go.mod"
	"github.com/spf13/cast v1.3.0/go.mod"
	"github.com/spf13/cobra v0.0.5/go.mod"
	"github.com/spf13/jwalterweatherman v1.0.0/go.mod"
	"github.com/spf13/pflag v1.0.3/go.mod"
	"github.com/spf13/viper v1.3.2/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/objx v0.1.1/go.mod"
	"github.com/stretchr/testify v1.2.2/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/stretchr/testify v1.4.0"
	"github.com/stretchr/testify v1.4.0/go.mod"
	"github.com/stretchr/testify v1.5.1"
	"github.com/stretchr/testify v1.5.1/go.mod"
	"github.com/tinylib/msgp v1.0.2/go.mod"
	"github.com/tinylib/msgp v1.1.0"
	"github.com/tinylib/msgp v1.1.0/go.mod"
	"github.com/uber-go/atomic v1.3.2"
	"github.com/uber-go/atomic v1.3.2/go.mod"
	"github.com/uber/jaeger-client-go v2.15.0+incompatible"
	"github.com/uber/jaeger-client-go v2.15.0+incompatible/go.mod"
	"github.com/uber/jaeger-lib v1.5.0"
	"github.com/uber/jaeger-lib v1.5.0/go.mod"
	"github.com/ugorji/go v1.1.4/go.mod"
	"github.com/ugorji/go v1.1.7/go.mod"
	"github.com/ugorji/go/codec v0.0.0-20181204163529-d75b2dcb6bc8/go.mod"
	"github.com/ugorji/go/codec v1.1.7/go.mod"
	"github.com/urfave/negroni v1.0.0/go.mod"
	"github.com/valyala/bytebufferpool v1.0.0/go.mod"
	"github.com/valyala/fasthttp v1.4.0/go.mod"
	"github.com/valyala/fasthttp v1.6.0/go.mod"
	"github.com/valyala/fasttemplate v1.0.1/go.mod"
	"github.com/valyala/tcplisten v0.0.0-20161114210144-ceec8f93295a/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20180127040702-4e3ac2762d5f/go.mod"
	"github.com/xeipuuv/gojsonpointer v0.0.0-20190809123943-df4f5c81cb3b/go.mod"
	"github.com/xeipuuv/gojsonreference v0.0.0-20180127040603-bd5ef7bd5415/go.mod"
	"github.com/xeipuuv/gojsonschema v1.1.0/go.mod"
	"github.com/xeipuuv/gojsonschema v1.2.0/go.mod"
	"github.com/xordataexchange/crypt v0.0.3-0.20170626215501-b2862e3d0a77/go.mod"
	"github.com/yalp/jsonpath v0.0.0-20180802001716-5cc68e5049a0/go.mod"
	"github.com/yudai/gojsondiff v1.0.0/go.mod"
	"github.com/yudai/golcs v0.0.0-20170316035057-ecda9a501e82/go.mod"
	"github.com/yudai/pp v2.0.1+incompatible/go.mod"
	"github.com/yuin/goldmark v1.1.27/go.mod"
	"gitlab.com/gitlab-org/gitaly v1.74.0"
	"gitlab.com/gitlab-org/gitaly v1.74.0/go.mod"
	"gitlab.com/gitlab-org/labkit v0.0.0-20190221122536-0c3fc7cdd57c/go.mod"
	"gitlab.com/gitlab-org/labkit v0.0.0-20200520155818-96e583c57891"
	"gitlab.com/gitlab-org/labkit v0.0.0-20200520155818-96e583c57891/go.mod"
	"go.opencensus.io v0.21.0/go.mod"
	"go.opencensus.io v0.22.0/go.mod"
	"go.opencensus.io v0.22.2"
	"go.opencensus.io v0.22.2/go.mod"
	"go.uber.org/atomic v1.3.2"
	"go.uber.org/atomic v1.3.2/go.mod"
	"golang.org/x/crypto v0.0.0-20180904163835-0709b304e793/go.mod"
	"golang.org/x/crypto v0.0.0-20181203042331-505ab145d0a9/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190510104115-cbcb75029529/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4"
	"golang.org/x/crypto v0.0.0-20190701094942-4def268fd1a4/go.mod"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550"
	"golang.org/x/crypto v0.0.0-20191011191535-87dc89f01550/go.mod"
	"golang.org/x/exp v0.0.0-20190121172915-509febef88a4/go.mod"
	"golang.org/x/exp v0.0.0-20190306152737-a1d7652674e8/go.mod"
	"golang.org/x/exp v0.0.0-20190510132918-efd6b22b2522/go.mod"
	"golang.org/x/exp v0.0.0-20190829153037-c13cbed26979/go.mod"
	"golang.org/x/exp v0.0.0-20191129062945-2f5052295587/go.mod"
	"golang.org/x/exp v0.0.0-20191227195350-da58074b4299"
	"golang.org/x/exp v0.0.0-20191227195350-da58074b4299/go.mod"
	"golang.org/x/image v0.0.0-20190227222117-0694c2d4d067/go.mod"
	"golang.org/x/image v0.0.0-20190802002840-cff245a6509b/go.mod"
	"golang.org/x/lint v0.0.0-20180702182130-06c8688daad7"
	"golang.org/x/lint v0.0.0-20180702182130-06c8688daad7/go.mod"
	"golang.org/x/lint v0.0.0-20181026193005-c67002cb31c3/go.mod"
	"golang.org/x/lint v0.0.0-20190227174305-5b3e6a55c961/go.mod"
	"golang.org/x/lint v0.0.0-20190301231843-5614ed5bae6f/go.mod"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3"
	"golang.org/x/lint v0.0.0-20190313153728-d0100b6bd8b3/go.mod"
	"golang.org/x/lint v0.0.0-20190409202823-959b441ac422/go.mod"
	"golang.org/x/lint v0.0.0-20190909230951-414d861bb4ac/go.mod"
	"golang.org/x/lint v0.0.0-20191125180803-fdd1cda4f05f"
	"golang.org/x/lint v0.0.0-20191125180803-fdd1cda4f05f/go.mod"
	"golang.org/x/mobile v0.0.0-20190312151609-d3739f865fa6/go.mod"
	"golang.org/x/mobile v0.0.0-20190719004257-d2bd2a29d028/go.mod"
	"golang.org/x/mod v0.0.0-20190513183733-4bf6d317e70e/go.mod"
	"golang.org/x/mod v0.1.0/go.mod"
	"golang.org/x/mod v0.1.1-0.20191105210325-c90efee705ee/go.mod"
	"golang.org/x/mod v0.2.0"
	"golang.org/x/mod v0.2.0/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20180826012351-8a410e7b638d/go.mod"
	"golang.org/x/net v0.0.0-20180906233101-161cd47e91fd/go.mod"
	"golang.org/x/net v0.0.0-20180911220305-26e67e76b6c3/go.mod"
	"golang.org/x/net v0.0.0-20181023162649-9b4f9f5ad519/go.mod"
	"golang.org/x/net v0.0.0-20181106065722-10aee1819953/go.mod"
	"golang.org/x/net v0.0.0-20181114220301-adae6a3d119a/go.mod"
	"golang.org/x/net v0.0.0-20181220203305-927f97764cc3/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190213061140-3a22650c66bd/go.mod"
	"golang.org/x/net v0.0.0-20190310074541-c10a0554eabf/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190327091125-710a502c58a2/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190501004415-9ce7a6920f09/go.mod"
	"golang.org/x/net v0.0.0-20190503192946-f4e77d36d62c/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980"
	"golang.org/x/net v0.0.0-20190613194153-d28f0bde5980/go.mod"
	"golang.org/x/net v0.0.0-20190620200207-3b0461eec859/go.mod"
	"golang.org/x/net v0.0.0-20190724013045-ca1201d0de80/go.mod"
	"golang.org/x/net v0.0.0-20190827160401-ba9fcec4b297/go.mod"
	"golang.org/x/net v0.0.0-20200114155413-6afb5195e5aa"
	"golang.org/x/net v0.0.0-20200114155413-6afb5195e5aa/go.mod"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2"
	"golang.org/x/net v0.0.0-20200202094626-16171245cfb2/go.mod"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b"
	"golang.org/x/net v0.0.0-20200226121028-0de0cce0169b/go.mod"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be"
	"golang.org/x/oauth2 v0.0.0-20180821212333-d2e6202438be/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190226205417-e64efc72b421/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d"
	"golang.org/x/oauth2 v0.0.0-20200107190931-bf48bf16ab8d/go.mod"
	"golang.org/x/sync v0.0.0-20180314180146-1d60e4601c6f/go.mod"
	"golang.org/x/sync v0.0.0-20181108010431-42b317875d0f/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190227155943-e225da77a7e6/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e"
	"golang.org/x/sync v0.0.0-20190911185100-cd5d95a43a6e/go.mod"
	"golang.org/x/sys v0.0.0-20180830151530-49385e6e1522/go.mod"
	"golang.org/x/sys v0.0.0-20180905080454-ebe1bf3edb33/go.mod"
	"golang.org/x/sys v0.0.0-20180909124046-d0be0721c37e/go.mod"
	"golang.org/x/sys v0.0.0-20181116152217-5ac8a444bdc5/go.mod"
	"golang.org/x/sys v0.0.0-20181205085412-a5c9d58dba9a/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190310054646-10058d7d4faa/go.mod"
	"golang.org/x/sys v0.0.0-20190312061237-fead79001313/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190502145724-3ef323f4f1fd/go.mod"
	"golang.org/x/sys v0.0.0-20190507160741-ecd444e8653b/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190624142023-c5567b49c5d0/go.mod"
	"golang.org/x/sys v0.0.0-20190626221950-04f50cda93cb/go.mod"
	"golang.org/x/sys v0.0.0-20190726091711-fc99dfbffb4e/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/sys v0.0.0-20191204072324-ce4227a45e2e/go.mod"
	"golang.org/x/sys v0.0.0-20200113162924-86b910548bc1/go.mod"
	"golang.org/x/sys v0.0.0-20200116001909-b77594299b42/go.mod"
	"golang.org/x/sys v0.0.0-20200223170610-d5e6a3e2c0ae/go.mod"
	"golang.org/x/sys v0.0.0-20200413165638-669c56c373c4"
	"golang.org/x/sys v0.0.0-20200413165638-669c56c373c4/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.1-0.20180807135948-17ff2d5776d2/go.mod"
	"golang.org/x/text v0.3.2"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/time v0.0.0-20181108054448-85acf8d2951c/go.mod"
	"golang.org/x/time v0.0.0-20190308202827-9d24e82272b4/go.mod"
	"golang.org/x/tools v0.0.0-20180828015842-6cd1fcedba52/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20181221001348-537d06c36207/go.mod"
	"golang.org/x/tools v0.0.0-20190114222345-bf090417da8b/go.mod"
	"golang.org/x/tools v0.0.0-20190226205152-f727befe758c/go.mod"
	"golang.org/x/tools v0.0.0-20190308174544-00c44ba9c14f/go.mod"
	"golang.org/x/tools v0.0.0-20190311212946-11955173bddd/go.mod"
	"golang.org/x/tools v0.0.0-20190312151545-0bb0c0a6e846/go.mod"
	"golang.org/x/tools v0.0.0-20190312170243-e65039ee4138/go.mod"
	"golang.org/x/tools v0.0.0-20190327201419-c70d86f8b7cf/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190425150028-36563e24a262/go.mod"
	"golang.org/x/tools v0.0.0-20190506145303-2d16b83fe98c/go.mod"
	"golang.org/x/tools v0.0.0-20190524140312-2c0ae7006135/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac"
	"golang.org/x/tools v0.0.0-20190621195816-6e04913cbbac/go.mod"
	"golang.org/x/tools v0.0.0-20190628153133-6cdbf07be9d0/go.mod"
	"golang.org/x/tools v0.0.0-20190816200558-6889da9d5479/go.mod"
	"golang.org/x/tools v0.0.0-20190829051458-42f498d34c4d/go.mod"
	"golang.org/x/tools v0.0.0-20190911174233-4f2ddba30aff/go.mod"
	"golang.org/x/tools v0.0.0-20191012152004-8de300cfc20a/go.mod"
	"golang.org/x/tools v0.0.0-20191119224855-298f0cb1881e/go.mod"
	"golang.org/x/tools v0.0.0-20191125144606-a911d9008d1f/go.mod"
	"golang.org/x/tools v0.0.0-20191216173652-a0e659d51361/go.mod"
	"golang.org/x/tools v0.0.0-20200117161641-43d50277825c"
	"golang.org/x/tools v0.0.0-20200117161641-43d50277825c/go.mod"
	"golang.org/x/tools v0.0.0-20200522201501-cb1345f3a375"
	"golang.org/x/tools v0.0.0-20200522201501-cb1345f3a375/go.mod"
	"golang.org/x/xerrors v0.0.0-20190717185122-a985d3407aa7/go.mod"
	"golang.org/x/xerrors v0.0.0-20191011141410-1b5146add898/go.mod"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543"
	"golang.org/x/xerrors v0.0.0-20191204190536-9bdfabe68543/go.mod"
	"google.golang.org/api v0.4.0/go.mod"
	"google.golang.org/api v0.7.0/go.mod"
	"google.golang.org/api v0.8.0/go.mod"
	"google.golang.org/api v0.9.0/go.mod"
	"google.golang.org/api v0.14.0/go.mod"
	"google.golang.org/api v0.15.0"
	"google.golang.org/api v0.15.0/go.mod"
	"google.golang.org/appengine v1.1.0"
	"google.golang.org/appengine v1.1.0/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.5.0/go.mod"
	"google.golang.org/appengine v1.6.1/go.mod"
	"google.golang.org/appengine v1.6.5"
	"google.golang.org/appengine v1.6.5/go.mod"
	"google.golang.org/genproto v0.0.0-20180817151627-c66870c02cf8/go.mod"
	"google.golang.org/genproto v0.0.0-20181202183823-bd91e49a0898"
	"google.golang.org/genproto v0.0.0-20181202183823-bd91e49a0898/go.mod"
	"google.golang.org/genproto v0.0.0-20190307195333-5fe7a883aa19/go.mod"
	"google.golang.org/genproto v0.0.0-20190418145605-e7d98fc518a7/go.mod"
	"google.golang.org/genproto v0.0.0-20190425155659-357c62f0e4bb/go.mod"
	"google.golang.org/genproto v0.0.0-20190502173448-54afdca5d873/go.mod"
	"google.golang.org/genproto v0.0.0-20190801165951-fa694d86fc64/go.mod"
	"google.golang.org/genproto v0.0.0-20190819201941-24fa4b261c55/go.mod"
	"google.golang.org/genproto v0.0.0-20190911173649-1774047e7e51/go.mod"
	"google.golang.org/genproto v0.0.0-20191216164720-4f79533eabd1/go.mod"
	"google.golang.org/genproto v0.0.0-20200115191322-ca5a22157cba"
	"google.golang.org/genproto v0.0.0-20200115191322-ca5a22157cba/go.mod"
	"google.golang.org/grpc v1.16.0"
	"google.golang.org/grpc v1.16.0/go.mod"
	"google.golang.org/grpc v1.19.0/go.mod"
	"google.golang.org/grpc v1.20.1/go.mod"
	"google.golang.org/grpc v1.21.1/go.mod"
	"google.golang.org/grpc v1.24.0"
	"google.golang.org/grpc v1.24.0/go.mod"
	"gopkg.in/DataDog/dd-trace-go.v1 v1.7.0"
	"gopkg.in/DataDog/dd-trace-go.v1 v1.7.0/go.mod"
	"gopkg.in/alecthomas/kingpin.v2 v2.2.6/go.mod"
	"gopkg.in/check.v1 v0.0.0-20161208181325-20d25e280405/go.mod"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127"
	"gopkg.in/check.v1 v1.0.0-20180628173108-788fd7840127/go.mod"
	"gopkg.in/errgo.v2 v2.1.0/go.mod"
	"gopkg.in/fsnotify.v1 v1.4.7"
	"gopkg.in/fsnotify.v1 v1.4.7/go.mod"
	"gopkg.in/go-playground/assert.v1 v1.2.1/go.mod"
	"gopkg.in/go-playground/validator.v8 v8.18.2/go.mod"
	"gopkg.in/mgo.v2 v2.0.0-20180705113604-9856a29383ce/go.mod"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7"
	"gopkg.in/tomb.v1 v1.0.0-20141024135613-dd632973f1e7/go.mod"
	"gopkg.in/yaml.v2 v2.2.1/go.mod"
	"gopkg.in/yaml.v2 v2.2.2"
	"gopkg.in/yaml.v2 v2.2.2/go.mod"
	"gopkg.in/yaml.v2 v2.2.4/go.mod"
	"gopkg.in/yaml.v2 v2.2.8"
	"gopkg.in/yaml.v2 v2.2.8/go.mod"
	"honnef.co/go/tools v0.0.0-20180728063816-88497007e858/go.mod"
	"honnef.co/go/tools v0.0.0-20190102054323-c2f93a96b099/go.mod"
	"honnef.co/go/tools v0.0.0-20190106161140-3f1c8253044a/go.mod"
	"honnef.co/go/tools v0.0.0-20190418001031-e561f6794a2a/go.mod"
	"honnef.co/go/tools v0.0.0-20190523083050-ea95bdfd59fc/go.mod"
	"honnef.co/go/tools v0.0.1-2019.2.3"
	"honnef.co/go/tools v0.0.1-2019.2.3/go.mod"
	"rsc.io/binaryregexp v0.2.0/go.mod"
	)
go-module_set_globals

DESCRIPTION="GitLab reverse proxy"
HOMEPAGE="https://gitlab.com/gitlab-org/gitlab-workhorse"
SRC_URI="https://gitlab.com/gitlab-org/${PN}/-/archive/v${PV}/${MY_P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test ) mirror"

RDEPEND="acct-user/gitlab-workhorse
	app-admin/logrotate
	media-libs/exiftool"

S="${WORKDIR}/${MY_P}"

DOCS=( CHANGELOG README.md )

src_unpack() {
	go-module_src_unpack

	if use test ; then
		git-r3_src_unpack
	fi
}

src_install() {
	einstalldocs
	emake PREFIX="${ED}"/usr install

	insinto /etc/logrotate.d
	newins "${FILESDIR}"/gitlab-workhorse.logrotate gitlab-workhorse

	newinitd "${FILESDIR}"/gitlab-workhorse.initd gitlab-workhorse
	newconfd "${FILESDIR}"/gitlab-workhorse.confd gitlab-workhorse
	systemd_dounit "${FILESDIR}"/gitlab-workhorse.service
	newtmpfiles "${FILESDIR}"/gitlab-workhorse.tmpfile gitlab-workhorse.conf

	insopts -o gitlab-workhorse -g gitlab -m 0600
	insinto /etc/gitlab-workhorse
	doins config.toml.example

	diropts -o gitlab-workhorse -g gitlab -m 0700
	keepdir /var/log/gitlab-workhorse
}

pkg_postinst() {
	tmpfiles_process gitlab-workhorse.conf
}
