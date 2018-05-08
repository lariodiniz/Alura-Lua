LARGURA_TELA = 320
ALTURA_TELA = 480

aviao_14bis = {
    src = "imagens/14bis.png",
    largura = 64,
    altura = 64,
    x = LARGURA_TELA / 2 - 64 / 2,
    y = ALTURA_TELA - 64 / 2
}

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

function love.load()

    love.window.setMode(LARGURA_TELA,ALTURA_TELA, {resizable = false})
    love.window.setTitle("14bis vc Meteoros")
    
    background = love.graphics.newImage("imagens/background.png")
    aviao_14bis.imagem = love.graphics.newImage(aviao_14bis.src)

    x, y, w, h = 20, 20, 60, 20
end


function love.update(dt)
   if love.keyboard.isDown('w','a','s','d') then
    mov14bis()
   end
end

-- Draw a coloured rectangle.
function love.draw()
    love.graphics.draw(background, 0,0)
    love.graphics.draw(aviao_14bis.imagem, aviao_14bis.x,aviao_14bis.y)
    
    
end