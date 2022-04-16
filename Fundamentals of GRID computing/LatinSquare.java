import java.io.File;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.List;
import java.util.Arrays;
import java.util.ArrayList;

class LatinSquare {
	private static int countAnswer = 0;
	
	private static int[][] initMatrix;
	
	// Клонирование матрицы
	private static int[][] clone(int[][] data) {
		int[][] result = new int[data.length][data.length];

		for (int i = 0; i < data.length; i++)
			result[i] = data[i].clone();	
		
		return result;
	}

	// Проверка наличия элемента в массиве
	private static boolean inArray(int[] data, int value)
	{
		for (int i = 0; i < data.length; i++)
		{
			if (data[i] == value)
			{			
				return true;
			}
		}
		
		return false;
	}

	// Проверка что матрица является латинским квадратом
	private static boolean check(int[][] data) {
		for (int i = 0; i < data.length; i++)
		{
			int[] lineRow = new int[data.length];
			int[] lineCol = new int[data.length];
			
			for (int k = 0; k < data.length; k++)
			{
				
				if (inArray(lineRow, data[i][k]) || inArray(lineCol, data[k][i]))
				{
					return false;
				}
				
				lineRow[k] = data[i][k];
				lineCol[k] = data[k][i];
			}
		}
		
		return true;
	}
	
	// Сравнение матрицы с входными данными
	private static boolean compareAnswer(int[][] data) {
		for (int i = 0; i < data.length; i++) {
			for (int k = 0; k < data.length; k++) {
				if (initMatrix[i][k] != 0 && data[i][k] != initMatrix[i][k])
				{
					return false;
				}
			}
		}

		countAnswer++;
		
		return true;
	}
	
	// Поиск матриц
	private static void findAnswer(int[][] data, int index, int value) {
		if (index > data.length * data.length - 1)
		{
			return;
		}

		int start = 0;
		int end = data.length;

		// Установка значения на основе которого ищутся матрицы
		if (index == 0)
		{
			start = value - 1;
			end = value;
		}

		for (int i = start; i < end; i++) {
			// Пропускаем если текущий элемент не соответсвует входным данным
			if (initMatrix[index % data.length][index / data.length] != 0 && initMatrix[index % data.length][index / data.length] != i + 1)
			{
				continue;
			}

			data[index % data.length][index / data.length] = i + 1;

			// Рекурсивно обращаемся к себе же
			findAnswer(clone(data), index + 1, 0);
			
			// Если рекурсия достигла последнего элемента, делаем проверки
			if (index == data.length * data.length - 1 )
			{
				if (check(data)) {
					compareAnswer(data);
				}
			}
		}

	}
	
	public static void main(String[] args) throws IOException {
		// Проверка аргументов
		if (args.length < 2) {
			System.out.println("For Start Use: java LatinSquare [FileName] [SearchKey]");
			
			return;
		}

		// Проверка наличия файла
		File f = new File(args[0]);
		
		if(!f.exists() || f.isDirectory()) { 
			System.out.format("File %s Not Found\n", args[0]);

			return;
		}

		// Чтение файла
		List<String[]> data = new ArrayList<String[]>();

		int columnsCount = -1;

		try (BufferedReader br = new BufferedReader(new FileReader(f)))	{
			String line;

			while ((line = br.readLine()) != null) {
				// Разбивка строки на колонки
				String[] columns = line.trim().split(" ");

				if (columns.length == 0) {
					continue;
				}

				if (columnsCount == -1)	{
					columnsCount = columns.length;
				}
				else if (columnsCount != columns.length) {
					System.out.println("Format File Not Correct");

					return;
				}

				data.add(columns);
			}
		}

		// Проверка что файл содержит квадратную матрицу
		if (columnsCount == -1 || data.size() != columnsCount) {
			System.out.println("Format File Not Correct");

			return;
		}

		// Преобразование списка в массив
		initMatrix = new int[columnsCount][columnsCount];

		for (int i = 0; i < columnsCount; i++) {
			for (int k = 0; k < columnsCount; k++) {
				initMatrix[i][k] = Integer.parseInt(data.get(i)[k]);
			}
		}

		// Создание пустой матрицы
		int[][] emptyMatrix = new int[columnsCount][columnsCount];

		for (int i = 0; i < columnsCount; i++) {
			for (int k = 0; k < columnsCount; k++) {
				emptyMatrix[i][k] = 0;
			}
		}

		// Запуск поиска матриц
		findAnswer(clone(emptyMatrix), 0, Integer.parseInt(args[1]));

		// Вывод результата
		System.out.println(countAnswer);
    }
}