class GaisansController < ApplicationController

 def index
 end

 def confirm

   shikomiryou=(100*1.1*params[:kosuu].to_i*1.05+10)/1000
   @shikomiryou=shikomiryou.round(1)
   nakamidai=@shikomiryou*params[:genryouhi].to_i

   @nakamidai=nakamidai
   @nakamidai_apiece=(@nakamidai/params[:kosuu].to_i).round(1)

   if shikomiryou <= 50
      @kamakouchin=45000
   elsif 50 < shikomiryou && shikomiryou <= 100
      @kamakouchin=90000
   elsif 100 < shikomiryou && shikomiryou < 130
      @kamakouchin=135000
  elsif 130 <= shikomiryou && shikomiryou <= 200
      @kamakouchin=70000
   elsif 200 < shikomiryou && shikomiryou <= 1000
      @kamakouchin=140000
   elsif 1000 < shikomiryou
      @kamakouchin=140000*((@shikomiryou/1000).ceil)
   end

   @kamakouchin_apiece=(@kamakouchin/params[:kosuu].to_i).round(1)

   if 500 <= params[:kosuu].to_i && params[:kosuu].to_i < 1000
     jikyuu=6000
   elsif 1000 <= params[:kosuu].to_i && params[:kosuu].to_i < 3000
     jikyuu=5000
   elsif 3000 <= params[:kosuu].to_i && params[:kosuu].to_i < 5000
     jikyuu=4750
   elsif 5000 <= params[:kosuu].to_i && params[:kosuu].to_i < 7500
     jikyuu=4500
   elsif 7500 <= params[:kosuu].to_i && params[:kosuu].to_i < 10000
     jikyuu=4250
   elsif 10000 <= params[:kosuu].to_i && params[:kosuu].to_i < 20000
     jikyuu=4000
   elsif 20000 <= params[:kosuu].to_i && params[:kosuu].to_i < 30000
     jikyuu=3750
   elsif 30000 <= params[:kosuu].to_i
     jikyuu=3500
   end

   if params[:youki]=="チューブ"or"ボトル"
     youki_seisanhi=params[:kosuu].to_i/500*jikyuu*4
   elsif params[:youki]=="ジャー"
     youki_seisanhi=params[:kosuu].to_i/500*jikyuu*5
   end

   if params[:gaikan]=="化粧函"
     hako_seisanhi=params[:kosuu].to_i/500*jikyuu*2.5
   elsif params[:gaikan]=="シュリンク"
     hako_seisanhi=params[:kosuu].to_i/100*jikyuu
   elsif params[:gaikan]=="なし"
     hako_seisanhi=0
   end

   @seisanhi=youki_seisanhi + hako_seisanhi + params[:kosuu].to_i/500*jikyuu*2.5+jikyuu*3
   @seisanhi_apiece=(@seisanhi/params[:kosuu].to_i).round(1)

   if params[:gaikan]=="化粧函"
     @houzaihi=(150+10+3)*1.2*100*params[:kosuu].to_i/5000+1*1.5*params[:kosuu].to_i
   elsif params[:gaikan]=="シュリンク"
     @houzaihi=150*1.2*100*params[:kosuu].to_i/5000+13*1.2*100*params[:kosuu].to_i*5000+10*1.5*params[:kosuu].to_i
   elsif params[:gaikan]=="なし"
     @houzaihi=150*1.2*100*params[:kosuu].to_i/5000+13*1.2*100*params[:kosuu].to_i*5000
   end

   @houzaihi_apiece=(@houzaihi/params[:kosuu].to_i).round(1)

   if params[:gaikan]=="化粧函"
     @kanrihi=55000+10000
   elsif params[:gaikan]=="シュリンク"
     @kanrihi=55000
   end

   @kanrihi_apiece=(@kanrihi/params[:kosuu].to_i).round(1)

   @mitsumorigenka=@nakamidai+@kamakouchin+@seisanhi+@houzaihi+@kanrihi
   @mitsumorigenka_apiece=(@mitsumorigenka/params[:kosuu].to_i).round(1)

   eigyourieki=@mitsumorigenka*0.42
   @eigyourieki=eigyourieki.round(1)
   @eigyourieki_apiece=(@eigyourieki/params[:kosuu].to_i).round(1)

   @mitsumorikakaku=(@mitsumorigenka+@eigyourieki).round(1)
   @mitsumorikakaku_apiece=(@mitsumorikakaku/params[:kosuu].to_i).round(1)

 end


end
