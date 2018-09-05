<template>
  <section class="dialogue">
   asdfasfasfd
  </section>
</template>

<script>
</script>

<style lang="scss" scoped>
  @import "src/style/public";
  .router-show-enter-active,
  .router-show-leave-active {
    transition: all 0.4s;
  }
  
  .router-show-enter,
  .router-show-leave-active {
    transform: translateX(100%);
  }
  
  @keyframes fadeOut {
    from {
      opacity: 1;
    }
    100% {
      opacity: 0;
    }
  }
  
  .consumer {
    position: fixed;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 100;
    .consumerbg {
      position: fixed;
      width: 100%;
      height: 100%;
      top: 0;
      background: #000;
      opacity: 0.5;
    }
    .consumercon {
      @include center;
      .login {
        background: #fff;
        border-radius: 5px;
        padding: 1rem;
        width: 12.3786666667rem;
        margin: 0 auto;
        .useid {
          width: 100%;
          border-bottom: 1px solid #d4d4d4;
          @include justify(flex-start);
          align-items: center;
          .mark {
            @include sizeColor(0.64rem, #333);
            letter-spacing: 0.5546666667rem;
            line-height: 2.0266666667rem;
            padding-left: 0.4266666667rem;
          }
          .input_mark {
            margin-right: 0.34rem;
            margin-left: 0.5rem;
            @include widthHeight(5.1rem, 2.0266666667rem);
            input {
              display: inline-block;
              width: 5.1rem;
              line-height: 2rem;
              @include sizeColor(0.64rem, #333);
            }
          }
          .svg_close {
            @include widthHeight(0.64rem, 0.64rem);
            svg {
              display: block;
              @include widthHeight(100%, 100%);
            }
          }
        }
        .useid_border {
          border-color: #45c01a;
        }
        .login_botton {
          margin-top: 1.536rem;
          text-align: center;
          background: #1aad19;
          border: 1px solid #179e16;
          border-radius: 5px;
          line-height: 1.6rem;
          @include sizeColor(0.7rem, #fff);
        }
      }
    }
  }
  
  .consumeradd {
    animation: fadeOut 0.4s 1 linear both;
  }
  
  .dialogue {
    width: 100%;
    background: #fff;
    .dialogue_con {
      padding-top: 2.06933rem;
      -webkit-overflow-scrolling: touch;
      .computer {
        @include widthHeight(100%, 1.9626666667rem);
        background: #f5f5f5;
        border-bottom: 1px solid #e0e0e0;
        .computer_link {
          @include justify(flex-start);
          .computer_icon {
            @include widthHeight(1.2933333333rem, 1.9626666667rem);
            margin-left: 1.0666666667rem;
            margin-right: 0.96rem;
            @include align;
            svg {
              @include widthHeight(100%, 1rem);
            }
          }
          .computer_text {
            line-height: 1.9626666667rem;
            @include sizeColor(0.5546666667rem, #474747);
            span {
              display: inline-block;
              @include sizeColor(0.5546666667rem, #474747);
            }
          }
        }
      }
      .conversation {
        width: 100%;
        ul {
          width: 100%;
          li {
            padding: 0.3413333333rem 0.5973333333rem;
            box-sizing: border-box;
            border-bottom: 1px solid #e0e0e0;
            @include justify(flex-start);
            .imgwipe {
              @include widthHeight(2.0906666667rem, 2.0906666667rem);
              position: relative;
              margin-right: 0.512rem;
              .redicon_num {
                position: absolute;
                right: -0.4rem;
                top: -0.3rem;
                @include widthHeight(0.8106666667rem, 0.8106666667rem);
                @include sizeColor(0.512rem, #fff);
                line-height: 0.8806666667rem;
                padding: 0 4px;
                text-align: center;
              }
              .redicon {
                position: absolute;
                right: -0.21rem;
                top: -0.21rem;
                @include widthHeight(0.4266666667rem, 0.4266666667rem);
                border-radius: 50%;
              }
              .imgstyle {
                @include widthHeight(2.0906666667rem, 100%);
                display: flex;
                justify-content: center;
                flex-flow: row wrap;
                align-items: flex-start;
                align-content: flex-start;
                overflow: hidden;
                background: #dddbdb;
                img {
                  width: 10%;
                  height: auto;
                  border: 0;
                  flex-grow: 2;
                }
              }
              .imgstyletwo {
                img {
                  width: 50%;
                  height: 50%;
                  flex-grow: 0;
                }
              }
            }
            .infordetail {
              width: 11.5626666667rem;
              padding-top: 0.2133333333rem;
              .infordetail_top {
                width: 100%;
                padding-bottom: 0.2133333333rem;
                span:nth-of-type(1) {
                  width: 8.7466666667rem;
                  @include sizeColor(0.5973333333rem, #38373c);
                }
                span:nth-of-type(2) {
                  @include sizeColor(0.4266666667rem, #b2b6b9);
                }
              }
              .infordetail_bot {
                width: 9.5573333333rem;
                @include sizeColor(0.512rem, #9e9e9e);
              }
            }
          }
        }
      }
    }
  }
</style>
