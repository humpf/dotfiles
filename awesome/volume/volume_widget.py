#!usr/bin/python3

def main():
    import os
    import subprocess, pygame 
    os.environ['SDL_VIDEO_WINDOW_POS'] = '%d,%d' % (700,900)
    size = (Width, Height) = (300, 25)

    pygame.display.quit()
    pygame.init()

    screen = pygame.display.set_mode(size)

    font = pygame.font.SysFont("arial", 20)
    clock = pygame.time.Clock()

    a = subprocess.check_output('amixer -D pulse get Master | grep "Front Left:"', shell=True)
    b = str(a)
    c = b.find("[")
    high = True
    full = True
    try:
        int(b[c+2])
    except ValueError:
        high = False
    try:
        int(b[c+3])
    except ValueError:
        full = False
    if high:
        
        if full:
            vol = int(b[c+1]+b[c+2]+b[c+3])
        else:
            vol = int(b[c+1]+b[c+2])
    
    else:
        vol = int(b[c+1])
    text = str(vol)+"%"

    i = 0
    while i <= 1:
        screen.fill((255,255,255))
        vol_text = font.render(text, True, (255, 0,0))
        screen.blit(vol_text, (Width - vol_text.get_width(),0 ))

        bar = pygame.draw.rect(screen, (255, 0, 0), (0,0 , (Width-vol_text.get_width())/100*vol, Height),0)
        clock.tick(50)
        i += 1
        pygame.display.update()
if __name__== "__main__":
    main()
