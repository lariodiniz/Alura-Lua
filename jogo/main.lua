LARGURA_TELA = 320
ALTURA_TELA = 480
MAX_METEOROS = 12

aviao_14bis = {
    src = "imagens/14bis.png",
    largura = 55,
    altura = 63,
    x = LARGURA_TELA / 2 - 64 / 2,
    y = ALTURA_TELA - 64 / 2
}

meteoros = {}


function temColisao(X1, Y1, L1, A1, X2, Y2, L2, A2)
    return X2 < X1 + L1 and
           X1 < X2 + L2 and
           Y1 < Y2 + A2 and
           Y2 < Y1 + A1
end

function criaMeteoro()
    meteoro = {
        x = math.random(LARGURA_TELA),
        y = -70,
        largura = 50,
        altura = 44,
        peso = math.random(3),
        deslocamento_horizontal = math.random(-1,1)
    }
    table.insert(meteoros, meteoro)
end

function removeMeteoros()
    for i = #meteoros, 1 , -1 do
        if meteoros[i].y > ALTURA_TELA then
            table.remove(meteoros, i)
        end
    end   
end

function moveMeteoros()
    for k, meteoro in pairs(meteoros) do
        meteoro.y = meteoro.y + meteoro.peso
        meteoro.x = meteoro.x + meteoro.deslocamento_horizontal
    end   
end

function mov14bis()
    if love.keyboard.isDown('w') then
        aviao_14bis.y = aviao_14bis.y - 1
    end
    if love.keyboard.isDown('s') then
        aviao_14bis.y = aviao_14bis.y + 1
    end
    if love.keyboard.isDown('a') then
        aviao_14bis.x = aviao_14bis.x - 1
    end
    if love.keyboard.isDown('d') then
        aviao_14bis.x = aviao_14bis.x + 1
    end
end

function destroiAviao()
    aviao_14bis.src = "imagens/explosao_nave.png"
    aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
    aviao_14bis.largura = 67
    aviao_14bis.altura = 77
end

function checaColisoes()
    for k, meteoro in pairs(meteoros) do
        if temColisao(
            meteoro.x, 
            meteoro.y, 
            meteoro.largura,
            meteoro.altura,
            aviao_14bis.x, 
            aviao_14bis.y, 
            aviao_14bis.largura,
            aviao_14bis.altura) then
                destroiAviao()
                FIM_JOGO = true
        end
    end  
end;

function love.load()

    math.randomseed(os.time())
    love.window.setMode(LARGURA_TELA,ALTURA_TELA, {resizable = false})
    love.window.setTitle("14bis vc Meteoros")
    
    background = love.graphics.newImage("imagens/background.png")

    aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)
    meteoro_img = love.graphics.newImage("imagens/meteoro.png")

    x, y, w, h = 20, 20, 60, 20
end


function love.update(dt)
    if not FIM_JOGO then
        if love.keyboard.isDown('w','a','s','d') then
            mov14bis()
        end

        removeMeteoros()
        if #meteoros < MAX_METEOROS then
            criaMeteoro()
        end
        moveMeteoros()

        checaColisoes()
    end
end

-- Draw a coloured rectangle.
function love.draw()
    love.graphics.draw(background, 0,0)
    love.graphics.draw(aviao_14bis.imagem, aviao_14bis.x,aviao_14bis.y)
   
    for k, meteoro in pairs(meteoros) do
        love.graphics.draw(meteoro_img, meteoro.x, meteoro.y)
    end    
end