using System;
using System.Collections;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace GridViewBeta2
{
	/// <summary>
	/// Summary description for UserControl1.
	/// </summary>
	[GuidAttribute("14547C64-EE88-4e4f-BE81-CBB7AB6BB8C6")]
	public class GridView : System.Windows.Forms.UserControl
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.Container components = null;
		private int NumRows  = 10;
		private System.Windows.Forms.ListView listView1;
		private int NumColumns  = 4;

		public GridView()
		{
			// This call is required by the Windows.Forms Form Designer.
			InitializeComponent();

			// TODO: Add any initialization after the InitForm call
			InitializeGrid();

		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if( disposing )
			{
				if( components != null )
					components.Dispose();
			}
			base.Dispose( disposing );
		}

		#region Component Designer generated code
		/// <summary>
		/// Required method for Designer support - do not modify 
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.listView1 = new System.Windows.Forms.ListView();
			this.SuspendLayout();
			// 
			// listView1
			// 
			this.listView1.GridLines = true;
			this.listView1.Name = "listView1";
			this.listView1.Size = new System.Drawing.Size(208, 176);
			this.listView1.TabIndex = 0;
			this.listView1.View = System.Windows.Forms.View.Details;
			this.listView1.SizeChanged += new System.EventHandler(this.listView1_SizeChanged);
			// 
			// GridView
			// 
			this.Controls.AddRange(new System.Windows.Forms.Control[] {
																		  this.listView1});
			this.Name = "GridView";
			this.Size = new System.Drawing.Size(208, 168);
			this.ResumeLayout(false);

		}
		#endregion


		public void InitializeGrid()
		{

			for (int i = 0; i < NumRows; i++)
			{
				ListViewItem anItem = new ListViewItem(" ");
				listView1.Items.Add(anItem);
				for (int j = 0; j < NumColumns; j++)
				{
					anItem.SubItems.Add(" ");
				}
			}

			for (int nCol=0; nCol < NumColumns; nCol++)
			{
				listView1.Columns.Add(" ", 25, HorizontalAlignment.Center);
			}

		}
	
	
		public GridView(int numRows, int numColumns)
		{
			NumRows = numRows;
			NumColumns = numColumns;
			InitializeComponent();
			InitializeGrid();
		}

		[DispId(1)]
		public void SetColumnName(int index, string aName)
		{
			if (index >= listView1.Columns.Count)
			{
				MessageBox.Show("SetColumnName:Column out of range");
				return; // precondition
			}

			listView1.Columns[index].Text = aName;
		}

		[DispId(2)]
		public void SetColumnWidth(int index, int theWidth)
		{
			if (index >= listView1.Columns.Count)
			{
				MessageBox.Show("SetColumnWidth:Column out of range");
				return; // precondition
			}
			listView1.Columns[index].Width = theWidth * (int)listView1.Font.SizeInPoints;
		}

		[DispId(3)]
		public void SetColumnNames(string[] columnNames)
		{
			for (int i = 0; i < columnNames.Length ; i++)
			{
				if (i >= listView1.Columns.Count)
				{
					listView1.Columns.Add(columnNames[i], columnNames[i].Length * (int)listView1.Font.SizeInPoints, HorizontalAlignment.Center);
				}
				else
				{
					listView1.Columns[i].Text = columnNames[i];
					listView1.Columns[i].Width = columnNames[i].Length * (int)Font.SizeInPoints;
				}
			}	
		}

		[DispId(4)]
		public void SetColumnWidths(int[] columnWidths)
		{
			for (int i = 0; i < columnWidths.Length ; i++)
			{
				if (i >= listView1.Columns.Count)
				{
					listView1.Columns.Add(" ", columnWidths[i] * (int)listView1.Font.SizeInPoints, HorizontalAlignment.Center);
				}
				else
				{
					listView1.Columns[i].Width = columnWidths[i] * (int)Font.SizeInPoints;
				}
			}	
		}

		[DispId(5)]
		public void SetCell(int aRow, int aColumn, string text)
		{
			if (aRow >= listView1.Items.Count) // precondition
			{
				MessageBox.Show("SetCell:Row out of range");
				return;
			}

			if (aColumn >= listView1.Columns.Count) // precondition
			{
				MessageBox.Show("SetCell:Column out of range");
				return;
			}
			if (aColumn == 0)
			{
				listView1.Items[aRow].Text = text;
			}	
			else
			{
				listView1.Items[aRow].SubItems[aColumn - 1].Text = text;
			}
		}

		[DispId(6)]
		public string GetCell(int aRow, int aColumn)
		{
			try
			{
				if (aColumn == 0)
				{
					return listView1.Items[aRow].Text;
				}	

				return listView1.Items[aRow].SubItems[aColumn].Text;
			}
			catch(Exception ex)
			{
				MessageBox.Show(ex.Message.ToString());
				return " ";
			}
		}

		[DispId(7)]
		public void SetFullRow(int nRow, string[] rowData)
		{
			for (int i = 0; i < rowData.Length ; i++)
			{
				SetCell(nRow, i, rowData[i]);
			}
		  	
		}

		[DispId(8)]
		public void SetFullColumn(int nColumn, string[] columnData)
		{
			for (int i = 0; i < columnData.Length ; i++)
			{
				SetCell(i, nColumn, columnData[i]);
			}
		  	
		}

		private void listView1_SizeChanged(object sender, System.EventArgs e)
		{
			listView1.Width = this.Width;
			listView1.Height = this.Height; 
		}

		public int NumberOfRows
		{
			get
			{
				return NumRows;
			}
			set
			{
				NumRows = value;
			}
			
		}

		public int NumberOfColumns
		{
			get
			{
				return NumColumns;
			}
			set
			{
				NumColumns = value;
			}
			
		}

	}
}
