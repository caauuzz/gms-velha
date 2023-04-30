global.gameData = array_create(9, noone);

size = 64;

player1 = true;

DrawLines = function()
{
	for (var i = 1; i < 3; i++)
	{
		draw_line(i * size, 0, i * size, room_height);
	}	
	
	for (var i = 1; i < 3; i++)
	{
		draw_line(0, i * size, room_width, i * size);	
	}
}

SelectCell = function()
{
	// Achando a posição do meu mouse	
	var _mouseX = mouse_x div size;
	var _mouseY = mouse_y div size;
	
	// Quando o mouse clicar eu chamo o metodo
	if (mouse_check_button_released(mb_left)) ClickCell(_mouseX, _mouseY);
	
	// Desenhando os símbolos
	DrawSymbols();
	
	// Destacando a celula em que o mouse esta por cima
	draw_set_alpha(0.1);
	draw_set_color(c_aqua);
	draw_rectangle(_mouseX * size, _mouseY * size, (_mouseX + 1) * size, (_mouseY + 1) * size, false);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

ClickCell = function(_x, _y)
{
	// Checando quem é o jogador, jogador 1 faz X e o jogador 2 faz O
	var _symbol = player1 == true ? "X" : "O";
	
	// Convertendo o dado 2D para 1D
	// Pegando a linha e multiplicando pela largura e somando a posição X
	var _value1D = _y * 3 + _x;
	
	// Mudando o valor apenas se ele ainda não tem valor!
	if (global.gameData[_value1D] == noone)
	{
		// Definindo o valor da célula para X
		global.gameData[_value1D] = _symbol;
	
		// Mudando de jogador
		player1 = !player1;	
	}
}

DrawSymbols = function()
{
	for (var i = 0; i < array_length(global.gameData); i++)
	{
		// Convertendo dados 1D para 2D
		// Definindo as colunas
		var _x = i mod 3;
		
		// Definindo as linhas
		var _y = i div 3;
		
		// Checar se tem algum valor na célula
		if (global.gameData[i] != noone)
		{
			draw_set_font(fFont);
			draw_set_halign(1);
			draw_set_valign(1);
			draw_text(_x * size + size/2, _y * size + size/2, global.gameData[i]);
			draw_set_font(-1);
			draw_set_halign(-1);
			draw_set_valign(-1);
		}
	}
}
