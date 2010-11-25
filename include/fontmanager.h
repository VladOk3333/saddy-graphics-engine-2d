/*!	\file fontmanager.h
	\author Kolesov Dmitiy, HiddenSeeker
	\brief Declaration of FontManager class

	This file contain declaration of FontManager class, which work with font
	load, render and free it.
*/

#ifndef FONTMANAGER_H__
#define FONTMANAGER_H__

#ifdef WIN32

#include <windows.h>
#include <WinDef.h>

#endif
#include "types.h"
#include "texture.h"

#ifdef WIN32

typedef HFONT tfont;
#endif

namespace sad
{

/*! Basic font class
*/
class BasicFont
{
 private:
 public:
	 /*! Renders a string
	     \param[in] str string
		 \param[in] rect bounding rectangle. If cannot render in it, renders starting from upper left rendering
	 */
	 virtual void render(const hst::string & str,const hRectF & rect)=0; 
	 /*! Destroys an exemplar
	 */
	 virtual ~BasicFont();
};


}

#ifdef WIN32
	#include "win32font.h"
#endif


namespace sad
{
	/*!	\class FontManager
		Keeps a collection of fonts, and provides accessing interface
	*/
	class FontManager
	{
	 private:
			 hst::hash<hst::string, sad::BasicFont *> m_fonts;
			 
			 static FontManager m_instance;

			 FontManager();
			 FontManager(const FontManager & o);
			 FontManager & operator=(const FontManager & o);
	 public:
		    /*! Adds a font and associates a key to it
			    \param[in] font font pointer
				\param[in] name associated name
			*/
		    void add(sad::BasicFont * font,const hst::string & name );
			/*!	Returns an object by a key
				\param[in] key associated key
				\return pointer to font object
			*/
		    static sad::BasicFont * get(const hst::string & key);
		    /*!	Deletes a font by a key
			    \param[in] key 
		    */
			static void remove(const hst::string &key);
	     	/*! Destructor
		    */
			~FontManager();
	};

}

#endif //FONTMANAGER_H__
	